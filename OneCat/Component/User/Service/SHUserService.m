//
//  SHUserService.m
//  OneCat
//
//  Created by 何振东 on 2017/6/1.
//  Copyright (c) 2017 shuihe.com. All rights reserved.
//

#import "SHUserService.h"

@implementation SHUserService

- (void)signInWithParam:(NSDictionary *)params handler:(void (^)(SHServiceModel *))handler {
    [self execute:USER_LOGIN params:params handler:handler];
}

@end
