//
//  common.h
//  MacWxHelper
//
//  Created by 果叔叔 on 2021/6/9.
//

#ifndef common_h
#define common_h

#import <Foundation/Foundation.h>
#import "SwizzledHelper.h"
#import "ZLJPrinter.h"
#import "fishhook.h"

NSString *httpPost(NSString *url, NSString *body);
NSString *httpGet(NSString *url);
NSString *genRandomString();

#endif /* common_h */
