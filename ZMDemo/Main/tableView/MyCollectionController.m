//
//  MyCollectionController.m
//  zmddm
//
//  Created by ddapp on 16/8/4.
//  Copyright © 2016年 Hzming. All rights reserved.
//

#import "MyCollectionController.h"
#import "MyCollectionCell.h"
@interface MyCollectionController ()<ZMTableViewCellDelegate>

@end

@implementation MyCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)requestData
{
    [self.parameter setObject:@(self.start) forKey:@"st"];
    //                                  正式使用时 ↓  用self.parameter替换，即可实现上下拉刷新数据
    [MyCollectionModel requestDataWithParameter:nil inView:self.view scrollView:self.tableView success:^(NSArray *result) {
       
        [self reloadDataWithArray:result];
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark -- ZMTableViewCellDelegate
- (void)removeWithModel:(ZMDataModel *)model indexPath:(NSIndexPath *)indexPath
{
    [self.dataSource removeObjectAtIndex:indexPath.row];
    
    [self.tableView reloadSection:indexPath.section withRowAnimation:UITableViewRowAnimationMiddle];
}

@end



