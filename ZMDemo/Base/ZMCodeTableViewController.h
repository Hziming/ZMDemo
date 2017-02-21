//
//  ZMCodeTableViewController.h
//  ZMDemo
//
//  Created by ddapp on 17/1/12.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import "ZMViewController.h"

@interface ZMCodeTableViewController : ZMViewController

@property (nonatomic, strong) UITableView *tableView;


- (void)removeRefresh;

- (void)removeHeaderRefresh;

- (void)removeFooterRefresh;

- (void)reloadData;

- (void)reloadDataWithArray:(NSArray *)data;

- (void)reloadDataWithArray:(NSArray *)data needNoDataBtn:(BOOL)isNeed;

@end
