//
//  SHUserRouter.h
//  OneCat
//
//  Created by 何振东 on 2017/5/30.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//
@import UIKit;
#import <Foundation/Foundation.h>
#import "JLRoutes.h"
#import "SHRouterDelegate.h"
#import "SHModule.h"
#import "UIViewController+SHRouter.h"


@interface SHRouter : NSObject

// 注册的模块
@property (nonatomic, strong, readonly) NSMutableDictionary *modules;

// 路由跳转的scheme，在主项目info中设定, 必须先调用此方法
@property (nonatomic, copy) NSString *scheme;

/**
 * 获取路由单例，子类重载此方法
 * @return 单例路由对象
 */
+ (instancetype)shareInstance;


// 处理url，用于AppleDalegate中回调
+ (BOOL)handleURL:(NSURL *)url;


/**
 * 注册某个模块的路由
 */
- (void)registerModule:(NSString *)moduleClassname;

/**
 * 注册模块路由数组
 */
- (void)registerModules:(NSArray *)moduleClassnames;

/**
 * 移除某个模块
 */
- (void)removeModule:(NSString *)moduleClassname;

/**
 * 通过push方式，将一个路由推入导航控制器
 * @param route 路由名称
 * @return 跳转是否成功
 */
- (BOOL)push:(NSString *)route;


/**
 * 以模类方式展现路由
 * @param route 路由名称
 * @return 跳转是否成功
 */
- (BOOL)present:(NSString *)route;


/**
 * 根据名称获取控制器
 * @param routeControllerName 控制器对应的路由名称
 * @param used 是否使用storyboard
 * @return 对应的控制器
 */
- (UIViewController *)viewController:(NSString *)routeControllerName forModule:(NSString *)moduleName useStoryboard:(BOOL)used;

    
@end


