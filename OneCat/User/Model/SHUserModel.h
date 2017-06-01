//
//  SHUserModel.h
//  OneCat
//
//  Created by 何振东 on 2017/6/1.
//  Copyright (c) 2017 shuihe.com. All rights reserved.
//

@import Foundation;
#import "SHBaseModel.h"

@interface SHUserModel : SHBaseModel

@property (copy, nonatomic) NSString *username;

@property (copy, nonatomic) NSString *nickname;

@property (copy, nonatomic) NSString *avatar;


@end

