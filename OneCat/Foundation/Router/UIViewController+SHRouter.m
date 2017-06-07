//
//  UIViewController+SHRouter.m
//  OneCat
//
//  Created by 何振东 on 2017/6/7.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import "UIViewController+SHRouter.h"


@implementation UIViewController (SHRouter)
static char SH_ROUTER_ACTION_KEY = 'a';
static char SH_ROUTER_PRIMARY_KEY_KEY = 'b';
static char SH_ROUTER_PARAMS_KEY = 'c';

- (NSString *)action {
    return objc_getAssociatedObject(self, &SH_ROUTER_ACTION_KEY);
}

- (void)setAction:(NSString *)action {
    objc_setAssociatedObject(self, &SH_ROUTER_ACTION_KEY, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)primaryKey {
    return objc_getAssociatedObject(self, &SH_ROUTER_PRIMARY_KEY_KEY);
}

- (void)setPrimaryKey:(NSString *)primaryKey {
    objc_setAssociatedObject(self, &SH_ROUTER_PRIMARY_KEY_KEY, primaryKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)routerParams {
    return objc_getAssociatedObject(self, &SH_ROUTER_PARAMS_KEY);
}

- (void)setRouterParams:(NSDictionary *)routerParams {
    objc_setAssociatedObject(self, &SH_ROUTER_PARAMS_KEY, routerParams, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
