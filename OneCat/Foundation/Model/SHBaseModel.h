//
//  SHBaseModel.h
//  OneCat
//
//  Created by 何振东 on 2017/6/1.
//  Copyright (c) 2017 shuihe.com. All rights reserved.
//

@import Foundation;
#import "NSObject+YYModel.h"

@interface SHBaseModel : NSObject

// 模型对象的主键id
@property (assign, nonatomic) int id;

// 创建时间 unix格式
@property (assign, nonatomic) NSInteger created_at;

// 创建时间 NSDate格式
@property (strong, nonatomic) NSDate *createdAt;

// 更新时间 unix格式
@property (assign, nonatomic) NSInteger updated_at;

// 更新时间 NSDate格式
@property (strong, nonatomic) NSDate *updatedAt;

@end
