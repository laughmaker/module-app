//
//  SHServiceModel.m
//  OneCat
//
//  Created by 何振东 on 2017/6/1.
//  Copyright © 2017年 shuihe.com. All rights reserved.
//

#import "SHServiceModel.h"

@implementation SHServiceModel

- (id)getDataObject:(Class)classname {
    return [classname modelWithJSON:self.data];
}

- (NSArray *)getDataArray:(Class)classname {
    return [classname modelArrayWithClass:classname json:self.data];
}

@end
