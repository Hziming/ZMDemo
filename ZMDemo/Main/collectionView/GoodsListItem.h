//
//  GoodsListItem.h
//  zmddm
//
//  Created by ddapp on 16/8/16.
//  Copyright © 2016年 Hzming. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeGoodsListModel;
@interface GoodsListItem : UICollectionViewCell


@property (nonatomic, strong) HomeGoodsListModel *model;

@end



/*
 "headImg": "goods/2016/0817/8a99652056967a3e0156967a3e5e0000.png",
 "id": 1,
 "max": 10,
 "name": "猴子摘桃11",
 "price": 4000,
 "priceFlash": 3900,
 "sales": 0
 */
@interface HomeGoodsListModel : ZMDataModel


@property (nonatomic, strong) NSString *headImg;
@property (nonatomic, assign) NSInteger goodsId;
@property (nonatomic, assign) NSInteger max;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, assign) CGFloat priceFlash;       //现价
@property (nonatomic, assign) NSInteger sales;          //销售量
@end
