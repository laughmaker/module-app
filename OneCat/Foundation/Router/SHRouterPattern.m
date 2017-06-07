//
//  SHRoutePatern.m
//  OneCat
//
//  Created by 何振东 on 2017/6/6.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import "SHRouterPattern.h"

@interface SHRouterPattern ()

@property (nonatomic, copy) NSString *controller;

@property (nonatomic, copy) NSString *action;

@property (nonatomic, copy) NSString *primaryKey;

@property (nonatomic, copy) NSString *moduleName;

@property (nonatomic, copy) NSDictionary *params;

@property (nonatomic, assign) BOOL useStoryboard;

@end

@implementation SHRouterPattern

+ (instancetype)routerPatternWithController:(NSString *)controllerName module:(NSString *)moduleName useStoryboard:(BOOL)useStoryboard {
    return [SHRouterPattern routerPatternWithController:controllerName module:moduleName action:nil primaryKey:nil params:nil useStoryboard:useStoryboard];
}

+ (instancetype)routerPatternWithController:(NSString *)controllerName module:(NSString *)moduleName action:(NSString *)action primaryKey:(NSString *)primaryKey params:(NSDictionary *)params useStoryboard:(BOOL)useStoryboard {
    SHRouterPattern *patern = [[SHRouterPattern alloc] init];
    patern.controller = controllerName;
    patern.action = action;
    patern.primaryKey = primaryKey;
    patern.params = params;
    patern.useStoryboard = useStoryboard;
    patern.moduleName = moduleName;
    
    return patern;
}



@end
