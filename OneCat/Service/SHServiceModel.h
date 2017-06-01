//
//  SHServiceModel.h
//  OneCat
//
//  Created by 何振东 on 2017/6/1.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHPageModel.h"
#import "NSObject+YYModel.h"

@interface SHServiceModel : NSObject

// 服务返回的状态码
@property (nonatomic, assign) NSInteger status;

// 服务返回的消息字符串
@property (nonatomic, copy) NSString *message;

// 服务返回的原始数据对象，一般为NSArray或NSDictionary
@property (nonatomic, strong) id data;

// 服务的分页对象
@property (nonatomic, copy) SHPageModel *page;

/**
 * 如果data对象为字典，则可传入对象类名，将数据转化为Model类型
 * @param classname 类名
 * @return Model的类型数据
 */
- (id)getDataObject:(Class)classname;

/**
 * 如果data对象为数组，则传入对象类型，将数据转化为包含对象的数组
 * @param classname 类名
 * @return NSArray
 */
- (NSArray *)getDataArray:(Class)classname;

@end
