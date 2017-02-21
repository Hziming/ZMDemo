//
//  ZMViewController.h
//  ZMDemo
//
//  Created by ddapp on 17/1/12.
//  Copyright © 2017年 Hzming. All rights reserved.
//



/**
 *  回调Block
 */
typedef void(^ZMBackRefreshData) ();


/**
 *  回调Block 带参数
 */
typedef void(^ZMBackRefreshDataWithObj) (id obj);



#import <UIKit/UIKit.h>

@interface ZMViewController : UIViewController

/**
 从第几条数据开始请求
 */
@property (nonatomic, assign) NSInteger start;


/**
 一次请求多少条
 */
@property (nonatomic, assign) NSInteger limit;


/**
 从第几页开始请求 （根据后台的情况来定是否用 page）
 */
@property (nonatomic, assign) NSInteger page;


/**
 判断是上拉加载更多还是下拉刷新
 */
@property (nonatomic, assign, getter=isDown) BOOL down;


/**
 判断是否已经成功加载过数据
 */
@property (nonatomic, assign, getter=isReload) BOOL reload;


/**
 数据源
 */
@property (nonatomic, strong) NSMutableArray *dataSource;


/**
 请求参数
 */
@property (nonatomic, strong) NSMutableDictionary *parameter;


/**
 “暂无数据” 的按钮
 */
@property (nonatomic) UIButton *noDataBtn;


@property (nonatomic, copy) ZMBackRefreshData refresh;

@property (nonatomic, copy) ZMBackRefreshDataWithObj refreshObj;


- (void)requestData;


/**
 导航条返回按钮方法，子类根据实际需要可重写此方法（例如返回刷新上个界面等）
 */
- (void)back;


/**
 导航条是否透明

 @param translucent 是否透明
 */
- (void)setNavigationBarTranslucent:(BOOL)translucent;


/**
 改变导航条的透明度 （使用场景：根据TableView的contentOffsetl来改变导航条的透明度）

 @param alpha 透明度
 */
- (void)setNavigationBarWithAlpha:(CGFloat)alpha;


@end
