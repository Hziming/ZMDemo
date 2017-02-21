//
//  ZMQuestionsController.m
//  JiuSeLu
//
//  Created by ddapp on 16/12/20.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import "ZMQuestionsController.h"
#import "ZMQuestionsCell.h"
#import "ProblemDetailsController.h"
@interface ZMQuestionsController ()<UITableViewDelegate>

@end

@implementation ZMQuestionsController



- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;

    [self.tableView registerNib:[UINib nibWithNibName:@"ZMQuestionsCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
}

- (void)requestData
{
    //API 和 参数自己到时候视情况而定
    [ZMQuestionsModel requestDataWithParameter:nil inView:nil scrollView:self.tableView success:^(NSArray *result) {
        
        [self reloadDataWithArray:result];

    } failure:^(NSError *error) {
        
    }];
}


#pragma mark <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ProblemDetailsController *pdvc = [storyboard instantiateViewControllerWithIdentifier:@"ProblemDetailsController"];
    ZMQuestionsModel *model = self.dataSource[indexPath.row];
    pdvc.problemId = model.id;
    pdvc.title = @"问题详情";
    pdvc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:pdvc animated:YES];
}


@end
