//
//  SHSettingModule.m
//  OneCat
//
//  Created by 何振东 on 2017/6/7.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import "SHSettingModule.h"

@implementation SHSettingModule

- (NSString *)routesfilePath {
    return [[NSBundle mainBundle] pathForResource:@"SHSettingRoutes" ofType:@"plist"];
}

@end
