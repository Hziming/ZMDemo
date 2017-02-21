//
//  MyCollectionCell.h
//  zmddm
//
//  Created by ddapp on 16/8/4.
//  Copyright © 2016年 Hzming. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyCollectionModel;

@interface MyCollectionCell : ZMTableViewCell

@property (nonatomic, strong) MyCollectionModel *model;


@end


@interface MyCollectionModel : ZMDataModel

@property (nonatomic, assign) NSInteger comments;
@property (nonatomic, assign) NSInteger display;
@property (nonatomic, strong) NSString *headImg;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, assign) CGFloat priceMk;
@property (nonatomic, assign) NSInteger sales;


/*
 comments = 0;
 display = 1;
 headImg = "goods/2016/0817/8a99652056967a3e0156967a3e5e0000.png";
 id = 1;
 name = "\U7334\U5b50\U6458\U684311";
 price = 4000;
 priceMk = 5000;
 sales = 9;
 */

@end
