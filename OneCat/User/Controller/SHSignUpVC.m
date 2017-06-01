//
//  SHSignUpVC.m
//  OneCat
//
//  Created by 何振东 on 2017/5/29.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import "SHSignUpVC.h"
#import "SHUserService.h"

@interface SHSignUpVC ()
@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation SHSignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.lbl.text = @"sdfdfdsf";

    NSDictionary *params = @{@"username": @"18502565746",
                             @"password": @"18502565746"};
    SHUserService *userService = [SHUserService service];
    [userService signInWithParam:params handler:^(SHServiceModel *serviceModel) {
        NSLog(@"model:%@", serviceModel);
        SHUserModel *user = [serviceModel getDataObject:[SHUserModel class]];
        NSLog(@"user:%@", user);
    }];
}


@end
