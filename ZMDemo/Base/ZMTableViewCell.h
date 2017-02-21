//
//  ZMTableViewCell.h
//  ZMDemo
//
//  Created by ddapp on 17/2/9.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMDataModel.h"


@protocol ZMTableViewCellDelegate <NSObject>

@optional


/**
 刷新某一行的数据
 */
- (void)reloadWithModel:(ZMDataModel *)model indexPath:(NSIndexPath *)indexPath;


/**
 增加一行

 @param model 增加的数据模型
 @param indexPath 增加的位置
 */
- (void)addWithModel:(ZMDataModel *)model indexPath:(NSIndexPath *)indexPath;


/**
 删除一行
 
 @param model 删除的数据模型
 @param indexPath 删除的位置
 */
- (void)removeWithModel:(ZMDataModel *)model indexPath:(NSIndexPath *)indexPath;


@end


@interface ZMTableViewCell : UITableViewCell

/**
 代理对象
 */
@property (nonatomic, weak) id<ZMTableViewCellDelegate> delegate;


@property (nonatomic, strong) NSIndexPath *indexPath;

@end

