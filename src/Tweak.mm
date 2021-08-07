//
// Created by 果叔叔 on 2021/8/7.
//

#import "Common/common.h"

#define Log(s, ...) NSLog(@"[MAIN] => %@", [NSString stringWithFormat:(s), ##__VA_ARGS__])

@implementation NSObject (iOSHooker)

+ (void)initHooker
{
    hookClassMethod(objc_getClass("UIDevice"), @selector(name), [self class], @selector(hook_UIDevice_name));
}

+ (NSString *)hook_UIDevice_name
{
    NSString *ret = [self hook_UIDevice_name];
    Log(@"UIDevice.name = %@", ret);
    return ret;
}

@end

static void __attribute__((constructor)) initialize()
{
    @autoreleasepool {
        NSString *bundleID = [[NSBundle mainBundle] bundleIdentifier];
        NSString *targetID = @"com.apple.SpringBoard";
        if (![bundleID isEqualToString:targetID]) {
            return;
        }

        Log(@"🎉!!! [%@] !!!🎉 👍----------------insert dylib success----------------👍", bundleID);

        [NSObject initHooker];
    }
}