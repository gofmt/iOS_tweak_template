//
//  ZLJPrinter.h
//  MacWxHelper
#import <Foundation/Foundation.h>
#import <mach-o/dyld.h>
#import <mach/mach.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLJPrinter : NSObject

+ (NSString *)printBlock:(id)aBlock;
+ (NSString *)callStackSymbolsLocateInImages:(NSArray <NSString *>*)images;

@end

NS_ASSUME_NONNULL_END
