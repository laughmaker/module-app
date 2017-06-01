//
//  SHUserRouter.h
//  OneCat
//
//  Created by 何振东 on 2017/5/30.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JLRoutes.h"
@import UIKit;


/**
 * 每一个路由，都由以下几部分组成
 * /:controller/:action/:primaryKey?paramKey1=paramValue1&paramKey2=paramValue2
 * 例如：/post/edit/123?title="my name is title"
 * 其中controller表示控制器对应的名称，去除掉前缀和后缀后的部分，action表示要进行什么操作，primaryKey表示主键，参数部分表示要传递给控制器的参数。
 * 其中除了controller，其余皆为可选
 */

@interface SHRouter : NSObject

/**
 * 获取路由单例，子类重载此方法
 * @return 单例路由对象
 */
+ (instancetype)router;

/**
 * 路由跳转的scheme
 * @return scheme name
 */
+ (NSString *)scheme;

/**
 * 返回模块名称
 * @return model name
 */
+ (NSString *)modelName;

/**
 * 子类重载该方法，提供路由
 * @return 路由匹配模式数组
 */
- (NSArray *)routePatterns;

/**
 * 需要先注册，才能调用
 * 注册路由时，第一个部分不要添加"/"，不然会产生空控制器
 * 子数可重载，提供定制方法
 */
- (void)registerRouter;

/**
 * 通过push方式，将一个路由推入导航控制器
 * @param route 路由名称
 */
- (void)push:(NSString *)route;

/**
 * 以模类方式展现路由
 * @param route 路由名称
 */
- (void)present:(NSString *)route;

/**
 * 打开一个路由
 * @param route 路由名称
 * @param isPresent YES：以模态方式   NO：以push方式
 */
- (void)open:(NSString *)route isPresent:(BOOL)isPresent;

/**
 * 根据名称获取控制器
 * @param routeControllerName 控制器对应的路由名称
 * @param used 是否使用storyboard
 * @return 对应的控制器
 */
+ (UIViewController *)viewController:(NSString *)routeControllerName useStoryboard:(BOOL)used;
    
@end
