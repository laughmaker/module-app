//
//  SHPageModel.h
//  OneCat
//
//  Created by 何振东 on 2017/6/1.
//  Copyright (c) 2017 shuihe.com. All rights reserved.
//


@import Foundation;
#import <objc/NSObjCRuntime.h>

@interface SHPageModel : NSObject

@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic, assign) NSInteger startIndex;
@property (nonatomic, assign) NSInteger endIndex;
@property (nonatomic, assign) NSInteger totalRows;
@property (nonatomic, assign) NSInteger totalPages;

@end
