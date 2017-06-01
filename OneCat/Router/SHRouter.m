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
@property (assign, nonatomic) BOOL isPresent;

@end

@implementation SHRouter

+ (instancetype)router {
    static dispatch_once_t onceToken;
    static SHRouter *router = nil;
    dispatch_once(&onceToken, ^{
        router = [[SHRouter alloc] init];
    });
    return router;
}

+ (NSString *)scheme {
    return @"onecat";
}

+ (JLRoutes *)jlRoutes {
    return [JLRoutes routesForScheme:[[self class] scheme]];
}

+ (NSString *)modelName {
    return @"User";
}

- (NSArray *)routePatterns {
    return @[];
}
    
- (void)registerRouter {
    JLRoutes *jlRoutes = [[self class] jlRoutes];

    mWeakSelf;
    for (int i = 0; i < self.routePatterns.count; ++i) {
        NSString *pattern = self.routePatterns[i];
        [jlRoutes addRoute:pattern handler:^BOOL(NSDictionary *parameters) {
            NSArray *urlComponents = [parameters[JLRoutePatternKey] componentsSeparatedByString:@"/"];
            
            UIViewController *viewController = [[self class] viewController:[urlComponents firstObject] useStoryboard:YES];
            UINavigationController *nav = (UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
            if (!weakSelf.isPresent) {
                [nav pushViewController:viewController animated:YES];
            } else {
                [nav presentViewController:viewController animated:YES completion:nil];
            }

            return YES;
        }];
    }
}
    
- (void)push:(NSString *)route {
    [self open:route isPresent:NO];
}

- (void)present:(NSString *)route {
    [self open:route isPresent:YES];
}

- (void)open:(NSString *)route isPresent:(BOOL)isPresent {
    self.isPresent = isPresent;
    NSURL *url = [NSURL URLWithString:route];
    [[UIApplication sharedApplication] openURL:url];
}

+ (UIViewController *)viewController:(NSString *)routeControllerName useStoryboard:(BOOL)used {
    NSString *controllerName = [NSString stringWithFormat:@"SH%@VC", routeControllerName];
    UIViewController *viewController = nil;
    if (used) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:[self modelName] bundle:nil];
        viewController = [storyboard instantiateViewControllerWithIdentifier:controllerName];
    } else {
        viewController = [[NSClassFromString(controllerName) alloc] init];
    }
    return viewController;
}


@end
