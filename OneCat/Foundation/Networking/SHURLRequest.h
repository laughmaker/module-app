//
//  SHURLRequest.h
//  OneCat
//
//  Created by 何振东 on 2017/6/1.
//  Copyright (c) 2017 shuihe.com. All rights reserved.
//

@import Foundation;

///网络请求状态返回码
typedef NS_ENUM(NSInteger, SH_URL_REQUEST_STATUS) {
    SH_REQUEST_STATUS_SUCCESS                    = 2000,//请求成功
    SH_REQUEST_STATUS_TOKEN_EXPIRE               = 2001,//token过期
    SH_REQUEST_STATUS_DATA_EXIST                 = 2002,//用户已存在,注册时判断
    SH_REQUEST_STATUS_USERNAME_OR_PASSWORD_ERROR = 2003,//用户名称或密码错误,登录时候判断
    SH_REQUEST_STATUS_SMS_OUATH_EXPIRE           = 2004,//短信验证码登录，验证码过期
    SH_REQUEST_STATUS_SMS_OUATH_ERROR            = 2005,//短信验证码登录，验证码错误
    SH_REQUEST_STATUS_FAILE                      = 4000,//请求失败
};


@interface SHURLRequest : NSObject

+ (instancetype)urlRequest;

/**
 *  POST请求
 *
 *  @param url           请求地址
 *  @param params            请求参数
 *  @param completionHandler 请求返回代理
 */
- (void)post:(NSString *)url params:(NSDictionary *)params completionHandler:(void (^)(id data, NSError *error))completionHandler;

/**
 *  POST请求
 *
 *  @param url           请求地址
 *  @param params            请求参数
 *  @param tag               该请求标志位
 *  @param completionHandler 请求返回代理
 */
- (void)post:(NSString *)url params:(NSDictionary *)params tag:(NSUInteger)tag completionHandler:(void (^)(id data, NSError *error, NSInteger tag))completionHandler;

@end
