//
//  TopicDetailsController.m
//  JiuSeLu
//
//  Created by ddapp on 17/1/9.
//  Copyright © 2017年 wzw. All rights reserved.
//

#import "TopicDetailsController.h"
#import "TopicDetailsCell.h"
@interface TopicDetailsController ()<UITableViewDelegate, ZMTableViewCellDelegate>



@end

@implementation TopicDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self removeRefresh];
    
    self.title = @"话题";
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TopicDetailsCell" bundle:nil] forCellReuseIdentifier:self.model.cellIdentifier]; //话题
}


- (void)requestData
{
    [self reloadDataWithArray:@[self.model] needNoDataBtn:NO];
}


#pragma mark <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //因为共用了一个模型，所以要重写父类方法， 所以不推荐共用模型
    ZMDynamicModel *model = self.dataSource[indexPath.row];
    return model.allHeight;
}


#pragma mark <OtherDynamicDelegate>
- (void)reloadWithModel:(ZMDynamicModel *)model indexPath:(NSIndexPath *)indexPath
{
    [self.dataSource replaceObjectAtIndex:indexPath.row withObject:model];
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    if (self.refreshObj) {
        self.refreshObj(model);
    }
}


@end
