//
//  SHUserRouter.m
//  OneCat
//
//  Created by 何振东 on 2017/5/30.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import "SHUserModule.h"
@import UIKit;

@interface SHUserModule ()

@end

@implementation SHUserModule

- (NSString *)routesfilePath {
    return [[NSBundle mainBundle] pathForResource:@"SHUserRoutes" ofType:@"plist"];
}

@end
