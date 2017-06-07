//
//  SHModule.h
//  OneCat
//
//  Created by 何振东 on 2017/6/7.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHRouterDelegate.h"

@interface SHModule : NSObject <SHRouterDelegate>

@property (nonatomic, copy) NSString *moduleName;

@property (nonatomic, strong) NSArray *routes;

+ (instancetype)module;

@end
