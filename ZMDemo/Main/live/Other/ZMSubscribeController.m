//
//  ZMSubscribeController.m
//  JiuSeLu
//
//  Created by ddapp on 16/12/20.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import "ZMSubscribeController.h"
#import "ZMSubscribeCell.h"

#import "SubscribeDVController.h"
#import "DVHomeController.h"
@interface ZMSubscribeController ()<UITableViewDelegate>

@end

@implementation ZMSubscribeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"ZMSubscribeCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}

- (void)requestData
{
    [ZMSubscribeCellModel requestDataWithParameter:nil inView:nil scrollView:self.tableView success:^(NSArray *result) {
        
        [self reloadDataWithArray:result];
        
    } failure:^(NSError *error) {
        
    }];
}


#pragma mark <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZMSubscribeCellModel *model = self.dataSource[indexPath.row];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    DVHomeController *dvvc = [storyboard instantiateViewControllerWithIdentifier:@"DVHomeController"];
    dvvc.hidesBottomBarWhenPushed = YES;
    dvvc.title = @"主页";
    dvvc.userId = model.dicModel[@"id"];
    KWeakSelf(self);
    [dvvc setRefresh:^(){
        weakself.reload = NO;
    }];
    [self.navigationController pushViewController:dvvc animated:YES];
}


@end
