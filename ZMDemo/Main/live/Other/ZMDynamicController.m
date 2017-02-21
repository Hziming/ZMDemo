//
//  ZMDynamicController.m
//  JiuSeLu
//
//  Created by ddapp on 16/12/20.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import "ZMDynamicController.h"
#import "ZMDynamicCell.h"
#import "ZMDynamicModel.h"
#import "OtherDynamicCell.h"
#import "TopicDetailsController.h"

@interface ZMDynamicController ()<UITableViewDelegate, ZMTableViewCellDelegate>

@end

@implementation ZMDynamicController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZMDynamicCell" bundle:nil] forCellReuseIdentifier:@"DynamicCell"];  //股票
    
    [self.tableView registerNib:[UINib nibWithNibName:@"OtherDynamicCell" bundle:nil] forCellReuseIdentifier:@"cell"]; //话题
}


- (void)requestData
{
    [self.parameter setObject:@(self.start) forKey:@"st"];
    //API 和 参数自己到时候视情况而定
    [ZMDynamicModel requestDataWithParameter:nil inView:nil scrollView:self.tableView success:^(NSArray *result) {
        
        [self reloadDataWithArray:result];
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZMDynamicModel *model = self.dataSource[indexPath.row];
    
    if (model.type == 1) {
        
        TopicDetailsController *tdvc = [[TopicDetailsController alloc] init];
        
        tdvc.model = model;
        tdvc.hidesBottomBarWhenPushed = YES;
        
        KWeakSelf(self)
        [tdvc setRefreshObj:^(ZMDynamicModel *model) {
            
            [weakself reloadWithModel:model indexPath:indexPath];
        }];
        
        [self.navigationController pushViewController:tdvc animated:YES];
    }
}

#pragma mark -- ZMTableViewCellDelegate
- (void)reloadWithModel:(ZMDataModel *)model indexPath:(NSIndexPath *)indexPath
{
    [self.dataSource replaceObjectAtIndex:indexPath.row withObject:model];
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
