//
//  ZMDataModel.h
//  ZMDemo
//
//  Created by ddapp on 17/1/12.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMDataModel : NSObject


/**
 字典模型（使用场景：1.比较简单的数据；2.比较懒的同学  - -!!! 希望没人介意）
 */
@property (nonatomic, strong) NSDictionary *dicModel;

/**
 cell复用标识
 */
@property (nonatomic, strong) NSString *cellIdentifier;

/**
 行高
 */
@property (nonatomic, assign) CGFloat rowHeight;


/**
 item 的Size
 */
@property (nonatomic, assign) CGSize itemSize;

/**
 存字典模型的构造方法   注意数据类型是字典

 @param dic         数据
 @param rowHeight   行高
 @param identifier  复用标识
 @return self
 */
- (instancetype)initWithDic:(NSDictionary *)dic rowHeight:(CGFloat)rowHeight identifier:(NSString *)identifier;


/**
 存字典模型的构造方法  注意数据类型是字典
 
 @param dic         数据
 @param itemSize    item大小
 @param identifier  复用标识
 @return self
 */
- (instancetype)initWithDic:(NSDictionary *)dic itemSize:(CGSize)itemSize identifier:(NSString *)identifier;


/**
 字典转模型方法 无实际意义，由子类重写   （依个人习惯用哪个第三方转模型）
 */
+ (instancetype)setupDataWithDic:(NSDictionary *)dic;

/**
 请求数据方法，无实际意义，由子类重写   
 */
+ (void)requestDataWithParameter:(NSDictionary *)parameter inView:(UIView *)view scrollView:(UIScrollView *)scrollView success:(void(^)(NSArray *result))success failure:(void(^)(NSError *error))failure;


@end
