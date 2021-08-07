cmake_minimum_required(VERSION 3.19)
project(iOS_tweak_template)

set(CMAKE_CXX_STANDARD 14)

include_directories(
        /opt/theos/vendor/include
)

add_definitions(-DXcodeTheos)
SET(CMAKE_OSX_SYSROOT /opt/theos/sdks/iPhoneOS12.2.sdk)
macro(ADD_FRAMEWORK fwname appname)
    find_library(FRAMEWORK_${fwname}
            NAMES ${fwname}
            PATHS ${CMAKE_OSX_SYSROOT}/System/Library
            PATH_SUFFIXES Frameworks
            NO_DEFAULT_PATH)
    if( ${FRAMEWORK_${fwname}} STREQUAL FRAMEWORK_${fwname}-NOTFOUND)
        MESSAGE(ERROR": Framework ${fwname} not found")
    else()
        TARGET_LINK_LIBRARIES(${appname} ${FRAMEWORK_${fwname}})
        MESSAGE(STATUS"Framework ${fwname} found at ${FRAMEWORK_${fwname}}")
    endif()
endmacro(ADD_FRAMEWORK)

add_library(
        ${PROJECT_NAME}
        src/Common/common.h
        src/Common/common.mm
        src/Common/fishhook.h
        src/Common/fishhook.c
        src/Common/SwizzledHelper.h
        src/Common/SwizzledHelper.mm
        src/Common/ZLJPrinter.h
        src/Common/ZLJPrinter.m
        src/Tweak.mm)

ADD_FRAMEWORK(UIKit ${PROJECT_NAME})

add_custom_target(
        ${PROJECT_NAME}_tweak_make
        COMMAND make
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

add_custom_target(
        ${PROJECT_NAME}_tweak_package
        COMMAND make package
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

add_custom_target(
        ${PROJECT_NAME}_tweak_install
        COMMAND make package install
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)