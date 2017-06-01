//
//  SHViewControllerInterceptor.m
//  OneCat
//
//  Created by 何振东 on 2017/6/1.
//  Copyright (c) 2017 shuihe.com. All rights reserved.
//

#import "SHViewControllerInterceptor.h"
#import "Aspects.h"
@import UIKit;

@implementation SHViewControllerInterceptor

+ (void)load
{
    [super load];

    [[self class] shareInstance];
}

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    static SHViewControllerInterceptor *intercepter = nil;
    dispatch_once(&onceToken, ^{
        intercepter = [[SHViewControllerInterceptor alloc] init];
    });
    return intercepter;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [UIViewController aspect_hookSelector:@selector(loadView) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
            [self loadView:[aspectInfo instance]];
        } error:nil];
    }
    return self;
}

- (void)loadView:(UIViewController *)viewController
{
}

@end
