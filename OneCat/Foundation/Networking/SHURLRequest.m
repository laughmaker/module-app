//
//  SHURLRequest.m
//  OneCat
//
//  Created by 何振东 on 2017/6/1.
//  Copyright (c) 2017 shuihe.com. All rights reserved.
//

#import "SHURLRequest.h"
#import "TWMacro.h"
@import UIKit;
#import "AFNetworking.h"

@implementation SHURLRequest

+ (instancetype)urlRequest {
    return [[SHURLRequest alloc] init];
}

- (void)post:(NSString *)urlPath params:(NSDictionary *)params completionHandler:(void (^)(id data, NSError *error))completionHandler
{
    [self post:urlPath params:params tag:-1 completionHandler:^(id data, NSError *error, NSInteger tag) {
        if (completionHandler) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(data, error);
            });
        }
    }];
}

- (void)post:(NSString *)urlPath params:(NSDictionary *)params tag:(NSUInteger)tag completionHandler:(void (^)(id data, NSError *error, NSInteger tag))completionHandler
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 20.0f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];

    if ([urlPath hasPrefix:@"https"]) {
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        securityPolicy.allowInvalidCertificates = YES;
        securityPolicy.validatesDomainName = NO;
        manager.securityPolicy = securityPolicy;
    }

    [manager POST:urlPath parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

//        if ([responseObject[@"status"] integerValue] == SH_REQUEST_STATUS_TOKEN_EXPIRE) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:kOAuthTokenExpired object:nil];
//            if (completionHandler) {
//                mGCDMain(^{ //token 过期
//                    completionHandler(nil, [[NSError alloc] init],tag);
//                });
//                return ;
//            }
//        }

        //TODO: 对于失败请求的情况一定要处理！！！
        if (completionHandler) {
            mGCDMain(^{
                completionHandler(responseObject, nil, tag);
            });
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

        if (completionHandler) {
            mGCDMain(^{
                completionHandler(nil, error, tag);
            });
        }
    }];

}

@end
