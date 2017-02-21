//
//  ZMQuestionsCell.h
//  JiuSeLu
//
//  Created by ddapp on 16/12/20.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZMQuestionsModel;

@interface ZMQuestionsCell : UITableViewCell

@property (nonatomic, strong) ZMQuestionsModel *model;


@end


@interface ZMQuestionsModel : ZMDataModel

@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *headImg;
@property (nonatomic, copy) NSNumber *id;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSNumber *parentId;
@property (nonatomic, copy) NSString *replyContent;
@property (nonatomic, copy) NSNumber *userId;

/*
 content = Dasdasdasdasdasdas;
 createTime = "2016-12-27 10:59:19";
 id = 5;
 nickName = Nick;
 parentId = 0;
 replyContent = Dasdasdasdasdasdas;
 userId = 5;
 */



@end
