//
//  SHProfileVC.m
//  OneCat
//
//  Created by 何振东 on 2017/5/29.
//  Copyright (c) 2017 shuihe.com. All rights reserved.
//

#import "SHProfileVC.h"
#import "SHRouter.h"

@interface SHProfileVC ()
@property (weak, nonatomic) IBOutlet UILabel *lbl;
- (IBAction)signUp:(id)sender;
- (IBAction)toSetting:(id)sender;
- (IBAction)removeSetting:(id)sender;
- (IBAction)pushSetting:(id)sender;

@end

@implementation SHProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lbl.text = @"sdfdsfdf";
}

- (IBAction)signUp:(id)sender {
    [[SHRouter shareInstance] push:@"SignUp/a/b?userId=434&age=323"];
}

- (IBAction)toSetting:(id)sender {
    [[SHRouter shareInstance] present:@"Setting"];
}

- (IBAction)removeSetting:(id)sender {
    [[SHRouter shareInstance] removeModule:@"SHSettingModule"];
}

- (IBAction)pushSetting:(id)sender {
    [[SHRouter shareInstance] push:@"Setting"];
}

@end
