//
//  SHBaseService.h
//  OneCat
//
//  Created by 何振东 on 2017/6/1.
//  Copyright (c) 2017 shuihe.com. All rights reserved.
//

@import Foundation;
#import "SHURLRequest.h"
#import "SHServiceModel.h"

@interface SHBaseService : NSObject

// 请求对象实体
@property (strong, nonatomic) SHURLRequest *urlRequest;

// 便捷方法获取服务对象
+ (instancetype)service;


/**
 * 执行服务
 * @param url 服务请求的地址
 * @param params 服务请求的参数
 * @param handler 服务执行完后的回调
 */
- (void)execute:(NSString *)url params:(NSDictionary *)params handler:(void (^)(SHServiceModel *serviceModel))handler;

@end
