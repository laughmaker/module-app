//
//  AppDelegate.m
//  OneCat
//
//  Created by 何振东 on 2017/5/29.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import "AppDelegate.h"
#import "SHRouter.h"
#import "SHUserModule.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [SHRouter shareInstance].scheme = @"onecat";
    [[SHRouter shareInstance] registerModules:@[@"SHUserModule", @"SHSettingModule"]];
//    [[SHRouter shareInstance] registerModule:@"SHSettingModule"];
    
    UIViewController *vc = [[SHRouter shareInstance] viewController:@"Profile" forModule:@"User" useStoryboard:YES];

    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options {
    return [SHRouter handleURL:url];
}


@end
