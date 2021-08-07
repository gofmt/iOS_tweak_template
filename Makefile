DEBUG = 1

THEOS_DEVICE_IP = localhost
THEOS_DEVICE_PORT = 2222
ARCHS = arm64

TARGET := iphone:clang:latest:13.0

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = iOS_tweak_template

${TWEAK_NAME}_FILES += $(wildcard src/*.mm)
${TWEAK_NAME}_FILES += $(wildcard src/Common/*.mm)
${TWEAK_NAME}_FILES += $(wildcard src/Common/*.m)
${TWEAK_NAME}_FILES += $(wildcard src/Common/*.c)
${TWEAK_NAME}_CFLAGS = -fobjc-arc

${TWEAK_NAME}_OBJCFLAGS += -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-function
${TWEAK_NAME}_OBJCFLAGS += -Wno-deprecated-declarations -Wno-arc-performSelector-leaks -Wno-visibility

include $(THEOS_MAKE_PATH)/tweak.mk

#after-install::
#	install.exec "open com.apple.SpringBoard"