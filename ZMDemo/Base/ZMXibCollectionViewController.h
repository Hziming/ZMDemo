//
//  ZMXibCollectionViewController.h
//  ZMDemo
//
//  Created by ddapp on 17/1/12.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import "ZMViewController.h"

@interface ZMXibCollectionViewController : ZMViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


- (void)removeRefresh;

- (void)removeHeaderRefresh;

- (void)removeFooterRefresh;

- (void)reloadData;

- (void)reloadDataWithArray:(NSArray *)data;

- (void)reloadDataWithArray:(NSArray *)data needNoDataBtn:(BOOL)isNeed;

@end
