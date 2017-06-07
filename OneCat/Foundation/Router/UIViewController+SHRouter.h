//
//  UIViewController+SHRouter.h
//  OneCat
//
//  Created by 何振东 on 2017/6/7.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIViewController (SHRouter)

@property (nonatomic, copy) NSString *action;

@property (nonatomic, copy) NSString *primaryKey;

@property (nonatomic, copy) NSDictionary *routerParams;

@end
