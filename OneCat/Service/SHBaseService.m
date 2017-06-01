//
//  SHBaseService.m
//  OneCat
//
//  Created by 何振东 on 2017/6/1.
//  Copyright (c) 2017 shuihe.com. All rights reserved.
//

#import "SHBaseService.h"

@implementation SHBaseService

+ (instancetype)service {
    return [[[self class] alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.urlRequest = [SHURLRequest urlRequest];
    }
    return self;
}

- (void)execute:(NSString *)url params:(NSDictionary *)params handler:(void (^)(SHServiceModel *serviceModel))handler {
    [self.urlRequest post:url params:params completionHandler:^(id data, NSError *error) {
        SHServiceModel *model = [SHServiceModel modelWithJSON:data];
        handler(model);
    }];
}

@end
