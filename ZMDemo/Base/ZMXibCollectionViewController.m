//
//  ZMXibCollectionViewController.m
//  ZMDemo
//
//  Created by ddapp on 17/1/12.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import "ZMXibCollectionViewController.h"

@interface ZMXibCollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ZMXibCollectionViewController


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (!self.isReload && self.collectionView.mj_header) {
        
        [self.collectionView.mj_header beginRefreshing];
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!self.isReload && !self.collectionView.mj_header) {
        
        [self requestData];
        
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.start = 0;
    self.limit = 20;
    self.down = YES;
    
    [self initRefresh];
    
    [self addNoDataButton];
}


- (void)initRefresh
{
    KWeakSelf(self)
    _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakself.start = 0;
        weakself.down = YES;
        [weakself requestData];
        
    }];
    
    _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakself.start += weakself.limit;
        //         self.start ++;
        weakself.down = NO;
        [weakself requestData];
        
    }];
    
}



- (void)removeRefresh
{
    _collectionView.mj_header = nil;
    
    _collectionView.mj_footer = nil;
}

- (void)removeHeaderRefresh
{
    _collectionView.mj_header = nil;
    
}


- (void)removeFooterRefresh
{
    _collectionView.mj_footer = nil;
}



- (void)addNoDataButton{
    
    [self.noDataBtn addTarget:self action:@selector(requestData) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:self.noDataBtn belowSubview:self.collectionView];
    
}


- (void)reloadData {
    
    [self reloadDataWithArray:nil];
}

- (void)reloadDataWithArray:(NSArray *)data
{
    [self reloadDataWithArray:data needNoDataBtn:YES];
}


- (void)reloadDataWithArray:(NSArray *)data needNoDataBtn:(BOOL)isNeed
{
    if (data) {
        if (self.down)    [self.dataSource removeAllObjects];
        
        [self.dataSource addObjectsFromArray:data];
        
    }
    [self.collectionView reloadData];
    
    
    if (self.dataSource.count < self.start + self.limit) {
        [self.collectionView.mj_footer endRefreshingWithNoMoreData];
    } else {
        [self.collectionView.mj_footer resetNoMoreData];
    }
    
    if (isNeed) {
        self.noDataBtn.center = self.collectionView.center;
        
        self.collectionView.hidden = self.dataSource.count == 0;
    }
    
    self.reload = YES;
    
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return self.dataSource.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    ZMDataModel *model = self.dataSource[indexPath.item];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:model.cellIdentifier forIndexPath:indexPath];
    
    [cell paddingDataModel:self.dataSource[indexPath.row] indexPath:indexPath delegate:self];
    
    return (UICollectionViewCell *)cell;
}


#pragma mark <UICollectionViewDelegateFlowLayout>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZMDataModel *model = self.dataSource[indexPath.item];
    
    return model.itemSize;
//    return CGSizeMake((KVIEW_W - 3) / 2.0, (KVIEW_W - 3) / 2.0 * 1.3);
}


@end
