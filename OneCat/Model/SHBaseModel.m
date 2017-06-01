//
//  SHBaseModel.m
//  OneCat
//
//  Created by 何振东 on 2017/6/1.
//  Copyright (c) 2017 shuihe.com. All rights reserved.
//

#import "SHBaseModel.h"

@implementation SHBaseModel

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSTimeInterval timestamp = [dic[@"created_at"] longValue];
    if (!timestamp) {
        return NO;
    }

    _createdAt = [NSDate dateWithTimeIntervalSince1970:timestamp];
    return YES;
}

- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic {
    if (!_createdAt) {
        return NO;
    }
    dic[@"timestamp"] = @(_createdAt.timeIntervalSince1970);
    return YES;
}

@end
