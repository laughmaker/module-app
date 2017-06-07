//
//  SHUserRouter.m
//  OneCat
//
//  Created by 何振东 on 2017/5/30.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import "SHRouter.h"
#import "NSArray+OVSelector.h"
@import UIKit;
#import "TWMacro.h"

@interface SHRouter ()
// 默认为push方式
@property (assign, nonatomic) BOOL isPush;

@property (nonatomic, strong) NSMutableDictionary *modules;

@property (nonatomic, strong) JLRoutes *jlRoutes;

@end

@implementation SHRouter

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static SHRouter *router = nil;
    dispatch_once(&onceToken, ^{
        router = [[SHRouter alloc] init];
    });
    return router;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.isPush = YES;
        self.modules = @{}.mutableCopy;
    }
    return self;
}

- (void)setScheme:(NSString *)scheme {
    _scheme = scheme;
    
    self.jlRoutes = [JLRoutes routesForScheme:scheme];
}

+ (BOOL)handleURL:(NSURL *)url {
    return [JLRoutes routeURL:url];
}

- (JLRoutes *)jlRoutes {
    return [JLRoutes routesForScheme:self.scheme];
}

- (void)registerModules:(NSArray *)moduleClassnames {
    for (NSString *classname in moduleClassnames) {
        [self registerModule:classname];
    }
}

- (void)registerModule:(NSString *)moduleClassname {
    Class moduleClass = NSClassFromString(moduleClassname);
    
    NSAssert([moduleClass isSubclassOfClass:[SHModule class]] == YES, @"moduleClass should be a subclass of SHModule!");

    SHModule *module = [[moduleClass alloc] init];
    
    NSString *routesPath = [module routesfilePath];
    NSDictionary *routerPatterns = [NSDictionary dictionaryWithContentsOfFile:routesPath];
    if (!routerPatterns) {
        NSLog(@"路由文件不存在");
        return;
    }
    
    module.moduleName = routerPatterns[@"moduleName"];;
    module.routes = routerPatterns[@"routes"];;
    
    // 记录模块
    self.modules[moduleClassname] = module;

    for (NSDictionary *route in module.routes) {
        SHRouterPattern *routerPattern = [SHRouterPattern routerPatternWithController:route[@"controller"] module:module.moduleName action:route[@"action"] primaryKey:route[@"primaryKey"] params:route[@"params"] useStoryboard:route[@"useStoryboard"]];
        [self addRouterPatern:routerPattern];
    }
}

- (void)removeModule:(NSString *)moduleClassname {
    SHModule *module = self.modules[moduleClassname];
    for (NSDictionary *route in module.routes) {
        SHRouterPattern *routerPattern = [SHRouterPattern routerPatternWithController:route[@"controller"] module:module.moduleName action:route[@"action"] primaryKey:route[@"primaryKey"] params:route[@"params"] useStoryboard:route[@"useStoryboard"]];
        NSString *patternString = [self patternStringWithRouterPattern:routerPattern];
        [self.jlRoutes removeRoute:patternString];
    }
    
    [self.modules removeObjectForKey:moduleClassname];
}

- (NSString *)patternStringWithRouterPattern:(SHRouterPattern *)routerPattern {
    NSMutableString *patternString = @"".mutableCopy;
    
    [patternString appendFormat:@"/%@", routerPattern.controller];
    
    if (routerPattern.action.length > 0) {
        [patternString appendFormat:@"/%@", routerPattern.action];
    }
    
    if (routerPattern.primaryKey.length > 0) {
        [patternString appendFormat:@"/%@", routerPattern.primaryKey];
    }
    
    // 如果有参数，拼接参数
    if (routerPattern.params.allKeys.count > 0) {
        [patternString appendString:@"?"];
    }
    for (NSString *key in routerPattern.params) {
        [patternString appendFormat:@"%@=%@&", key, routerPattern.params[key]];
    }
    
    // 删除最后一个&符号
    if (routerPattern.params.allKeys.count > 0) {
        NSRange deleteRange = {[patternString length] - 1, 1};
        [patternString deleteCharactersInRange:deleteRange];
    }
    
    return patternString;
}


- (void)addRouterPatern:(SHRouterPattern *)routerPattern {
    NSString *patternString = [self patternStringWithRouterPattern:routerPattern];
    
    mWeakSelf;
    [self.jlRoutes addRoute:patternString handler:^BOOL(NSDictionary *parameters) {
        NSURL *url = parameters[JLRouteURLKey];

        UIViewController *viewController = [weakSelf viewController:url.host forModule:routerPattern.moduleName useStoryboard:YES];
        
        // 设置action和primaryKey
        for (int i = 0; i < url.pathComponents.count; i++) {
            NSString *path = url.pathComponents[i];
            if ([path isEqual:@"/"]) {
                continue;
            }
            
            if (i == 1) {
                viewController.action = path;
            } else if (i == 2) {
                viewController.primaryKey = path;
            }
        }
        
        // 取出传递的参数
        NSArray *queries = [url.query componentsSeparatedByString:@"&"];
        NSMutableDictionary *routerParams = @{}.mutableCopy;
        for (NSString *queryString in queries) {
            NSArray *paramsArray = [queryString componentsSeparatedByString:@"="];
            if (paramsArray.count == 2) {
                routerParams[paramsArray[0]] = paramsArray[1];
                viewController.routerParams = routerParams;
            } else {
                NSLog(@"参数格式不对！");
            }
        }
        
        UINavigationController *nav = (UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
        if (weakSelf.isPush) {
            [nav pushViewController:viewController animated:YES];
        } else {
            [nav presentViewController:viewController animated:YES completion:nil];
        }
        
        return YES;
    }];
}

- (BOOL)push:(NSString *)route {
    return [self open:route isPush:YES];
}

- (BOOL)present:(NSString *)route {
    return [self open:route isPush:NO];
}

- (BOOL)open:(NSString *)route isPush:(BOOL)isPush {
    self.isPush = isPush;
    
    NSString *routeUrl = [NSString stringWithFormat:@"%@://%@", self.scheme, route];
    NSURL *url = [NSURL URLWithString:routeUrl];
    
    BOOL result = [JLRoutes canRouteURL:url];
    if (result) {
        [[UIApplication sharedApplication] openURL:url];
    } else {
        NSLog(@"cann't open your url!");
    }
    
    return result;
}

- (UIViewController *)viewController:(NSString *)routeControllerName forModule:(NSString *)moduleName useStoryboard:(BOOL)used {
    NSString *controllerName = [NSString stringWithFormat:@"SH%@VC", routeControllerName];
    UIViewController *viewController = nil;
    if (used) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:moduleName bundle:nil];
        viewController = [storyboard instantiateViewControllerWithIdentifier:controllerName];
    } else {
        viewController = [[NSClassFromString(controllerName) alloc] init];
    }
    return viewController;
}


@end
