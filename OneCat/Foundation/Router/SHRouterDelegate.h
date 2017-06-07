//
//  SHRouterDataSource.h
//  OneCat
//
//  Created by 何振东 on 2017/6/7.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import "SHRouterPattern.h"
#import <Foundation/Foundation.h>

@protocol SHRouterDelegate <NSObject>

@required

// 实现类提模块路由文件的路径
- (NSString *)routesfilePath;

@end
