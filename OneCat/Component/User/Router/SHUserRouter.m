//
//  SHUserRouter.m
//  OneCat
//
//  Created by 何振东 on 2017/5/30.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import "SHUserRouter.h"
#import "NSArray+OVSelector.h"
@import UIKit;
#import "TWMacro.h"

@interface SHUserRouter ()

@end

@implementation SHUserRouter

+ (instancetype)router {
    static dispatch_once_t onceToken;
    static SHUserRouter *router = nil;
    dispatch_once(&onceToken, ^{
        router = [[SHUserRouter alloc] init];
    });
    return router;
}

+ (NSString *)modelName {
    return @"User";
}

- (NSArray *)routePatterns {
    return @[
        @"Profile/*",
        @"SignUp/*",
    ];
}

@end
