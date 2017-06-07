//
//  SHModule.m
//  OneCat
//
//  Created by 何振东 on 2017/6/7.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import "SHModule.h"

@implementation SHModule

+ (instancetype)module {
    return [[[self class] alloc] init];
}

- (NSString *)routesfilePath {
    return nil;
}

@end
