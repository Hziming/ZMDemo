//
//  ZMDynamicModel.h
//  JiuSeLu
//
//  Created by ddapp on 16/12/27.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMDynamicModel : ZMDataModel

@property (nonatomic, copy) NSString *buyIn;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, copy) NSString *headImg;

@property (nonatomic, assign) NSInteger dvId;

@property (nonatomic, copy) NSString *dvUserName;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *imgs;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, copy) NSString *problemContent;

@property (nonatomic, assign) NSInteger problemId;

@property (nonatomic, copy) NSString *stockName;

@property (nonatomic, copy) NSString *stockNo;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger ifCollection;


@property (nonatomic, assign) CGFloat allHeight;

@property (nonatomic, assign) CGFloat contentHeight;

@property (nonatomic, assign) CGFloat image_W;

@property (nonatomic, assign) CGFloat dynamic_image_W;


//后台数据给的不严谨只好从新写一个方法。。。。
+ (instancetype) initWithDic:(NSDictionary *)dic;

+ (instancetype) initWithDic:(NSDictionary *)dic type:(NSInteger)type;




@end


/*
 id ID
 nickName 昵称
 title 标题
 content 内容
 imgs 图片地址，多张图片以 ,号好开
 stockNo 股票编号
 stockName 股票名称
 buyIn 买入价格
 type 类型 1:话题2:回复3:直播
 dvId 大VID
 dvUsername 大V昵称
 problemId 问题ID
 replyContent 问题内容
 createTime 创建时间
 
 */

