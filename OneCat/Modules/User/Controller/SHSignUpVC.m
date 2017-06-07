//
//  SHSignUpVC.m
//  OneCat
//
//  Created by 何振东 on 2017/5/29.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import "SHSignUpVC.h"
#import "SHUserService.h"
#import "UIViewController+SHRouter.h"

@interface SHSignUpVC ()
@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation SHSignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.lbl.text = @"sdfdfdsf";

    NSDictionary *params = @{@"username": @"333",
                             @"password": @"333"};
    SHUserService *userService = [SHUserService service];
    [userService signInWithParam:params handler:^(SHServiceModel *serviceModel) {
        NSLog(@"model:%@", serviceModel);
        SHUserModel *user = [serviceModel getDataObject:[SHUserModel class]];
        NSLog(@"user:%@", user);
    }];
    
    NSLog(@"action:%@", self.action);
    NSLog(@"primaryKey:%@", self.primaryKey);
    NSLog(@"params:%@", self.routerParams);
}


@end
