//
//  common.m
//  MacWxHelper
//
//  Created by 果叔叔 on 2021/6/9.
//

#import "common.h"

void LLog(NSString *str) {
    NSLog(@"------------------------------------------------------------------------------------------------");
    
    int stepLog = 800;
    NSInteger strLen = [@([str length]) integerValue];
    NSInteger countInt = strLen / stepLog;

    if (strLen > stepLog) {
        for (int i=1; i <= countInt; i++) {
            NSString *character = [str substringWithRange:NSMakeRange((i*stepLog)-stepLog, stepLog)];
            NSLog(@"%@", character);

        }
        NSString *character = [str substringWithRange:NSMakeRange((countInt*stepLog), strLen-(countInt*stepLog))];
        NSLog(@"%@", character);
    } else {
        NSLog(@"%@", str);
    }
    
    NSLog(@"------------------------------------------------------------------------------------------------");
}

NSString *httpPost(NSString *url, NSString *body) {
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    req.HTTPMethod = @"POST";
    req.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    __block NSError *err = nil;
    __block NSData *data = nil;
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    [[[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable _data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        err = error;
        data = _data;
        dispatch_semaphore_signal(sem);
    }] resume];
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    
    if (err != nil) {
        return nil;
    }
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

NSString *httpGet(NSString *url) {
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    __block NSError *err = nil;
    __block NSData *data = nil;
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    [[[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable _data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        err = error;
        data = _data;
        dispatch_semaphore_signal(sem);
    }] resume];
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    
    if (err != nil) {
        return nil;
    }
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

NSString *genRandomString() {
    NSString *strAll = @"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSString *result = [[NSMutableString alloc]initWithCapacity:16];
    for (int i = 0; i < 16; i++)
    {
        NSInteger index = arc4random() % (strAll.length-1);
        char tempStr = [strAll characterAtIndex:index];
        result = (NSMutableString *)[result stringByAppendingString:[NSString stringWithFormat:@"%c",tempStr]];
    }
    
    return result;
}
