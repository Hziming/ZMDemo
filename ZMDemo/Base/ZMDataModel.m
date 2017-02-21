//
//  ZMDataModel.m
//  ZMDemo
//
//  Created by ddapp on 17/1/12.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import "ZMDataModel.h"

@implementation ZMDataModel


- (instancetype)initWithDic:(NSDictionary *)dic rowHeight:(CGFloat)rowHeight identifier:(NSString *)identifier;
{
    self = [super init];
    
    if (self) {
        self.dicModel = dic;
        self.rowHeight = rowHeight;
        self.cellIdentifier = identifier;
    }
    
    return self;
}

- (instancetype)initWithDic:(NSDictionary *)dic itemSize:(CGSize)itemSize identifier:(NSString *)identifier;
{
    self = [super init];
    
    if (self) {
        self.dicModel = dic;
        self.itemSize = itemSize;
        self.cellIdentifier = identifier;
    }
    
    return self;
}


+ (instancetype)setupDataWithDic:(NSDictionary *)dic
{
    return [ZMDataModel mj_objectWithKeyValues:dic];
}


+ (void)requestDataWithParameter:(NSDictionary *)parameter inView:(UIView *)view scrollView:(UIScrollView *)scrollView success:(void(^)(NSArray *result))success failure:(void(^)(NSError *error))failure {
    
    
}

@end
