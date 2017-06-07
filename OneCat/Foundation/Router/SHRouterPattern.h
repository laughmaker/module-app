//
//  SHRoutePatern.h
//  OneCat
//
//  Created by 何振东 on 2017/6/6.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;


/**
 * 每一个路由，都由以下几部分组成
 * /:controller/:action/:primaryKey?paramKey1=paramValue1&paramKey2=paramValue2
 * 例如：/post/edit/123?title="my name is title"
 * 其中controller表示控制器对应的名称，去除掉前缀和后缀后的部分，action表示要进行什么操作，primaryKey表示主键，参数部分表示要传递给控制器的参数。
 * 其中除了controller，其余皆为可选
 */
@interface SHRouterPattern : NSObject

// 控制器名称，类名去掉SH前缀和后缀VC的部分，此部分必须设置
@property (nonatomic, copy, readonly) NSString *controller;

// 操作名称，此部分可为nil
@property (nonatomic, copy, readonly) NSString *action;

// 路由模式主键，可为nil
@property (nonatomic, copy, readonly) NSString *primaryKey;

// 传递的参数，可为nil
@property (nonatomic, copy, readonly) NSDictionary *params;

// 该控制器是否则Storyboard创建
@property (nonatomic, assign, readonly) BOOL useStoryboard;

// 模块名称
@property (nonatomic, copy, readonly) NSString *moduleName;

+ (instancetype)routerPatternWithController:(NSString *)controllerName module:(NSString *)moduleName useStoryboard:(BOOL)useStoryboard;

+ (instancetype)routerPatternWithController:(NSString *)controllerName module:(NSString *)moduleName action:(NSString *)action primaryKey:(NSString *)primaryKey params:(NSDictionary *)params useStoryboard:(BOOL)useStoryboard;


@end
