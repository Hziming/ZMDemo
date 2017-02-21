//
//  ZMCodeTableViewController.m
//  ZMDemo
//
//  Created by ddapp on 17/1/12.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import "ZMCodeTableViewController.h"

@interface ZMCodeTableViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ZMCodeTableViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (!self.isReload && self.tableView.mj_header) {
        
        [self.tableView.mj_header beginRefreshing];
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!self.isReload && !self.tableView.mj_header) {
        
        [self requestData];
        
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.start = 0;
    self.limit = 20;
    self.down = YES;
    
    [self createTableView];
    
    [self initRefresh];
    
    [self addNoDataButton];
}


- (void)initRefresh
{
    KWeakSelf(self)
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakself.start = 0;
        weakself.down = YES;
        [weakself requestData];
        
    }];
    
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakself.start += weakself.limit;
        //         self.start ++;
        weakself.down = NO;
        [weakself requestData];
        
    }];
    
}


- (void)removeRefresh
{
    _tableView.mj_header = nil;
    
    _tableView.mj_footer = nil;
}

- (void)removeHeaderRefresh
{
    _tableView.mj_header = nil;
    
}


- (void)removeFooterRefresh
{
    _tableView.mj_footer = nil;
}



- (void)addNoDataButton{
    
    [self.noDataBtn addTarget:self action:@selector(requestData) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:self.noDataBtn belowSubview:self.tableView];
    
}



- (void)createTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = K_BACKGROUD_color;
    [self.view addSubview:self.tableView];
    
    __weak typeof(self)weekSelf = self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weekSelf.view);
    }];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.tableFooterView = [UIView new];
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
    [self.tableView reloadData];
    
    
    if (self.dataSource.count < self.start + self.limit) {
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    } else {
        [self.tableView.mj_footer resetNoMoreData];
    }
    
    if (isNeed) {
        self.noDataBtn.center = self.tableView.center;
        
        self.tableView.hidden = self.dataSource.count == 0;
    }
    
    self.reload = YES;
    
}

#pragma mark - tableview数据源代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZMDataModel *model = self.dataSource[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellIdentifier];
    
    [cell paddingDataModel:self.dataSource[indexPath.row] indexPath:indexPath delegate:self];
    
    return cell;
}

#pragma mark <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZMDataModel *model = self.dataSource[indexPath.row];
    
    return model.rowHeight;
}



@end
