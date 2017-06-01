//
//  SHUserService.h
//  OneCat
//
//  Created by 何振东 on 2017/6/1.
//  Copyright (c) 2017 shuihe.com. All rights reserved.
//

@import Foundation;
#import "SHUserAPI.h"
#import "SHBaseService.h"
#import "SHUserModel.h"

@interface SHUserService : SHBaseService

- (void)signInWithParam:(NSDictionary *)params handler:(void (^)(SHServiceModel *serviceModel))handler;

@end
