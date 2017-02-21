//
//  DVHomeController.m
//  JiuSeLu
//
//  Created by ddapp on 16/12/26.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import "DVHomeController.h"

#import "ZMDynamicModel.h"
#import "OtherDynamicCell.h"

#import "TopicDetailsController.h"
#import "ZMPhotoView.h"

@interface DVHomeController ()<UITableViewDelegate, ZMTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *info;
@property (weak, nonatomic) IBOutlet UIButton *ifSubscriptioin;
@property (weak, nonatomic) IBOutlet UILabel *fans;

@property (weak, nonatomic) IBOutlet UIButton *askHim;

@end

@implementation DVHomeController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setNavigationBarTranslucent:YES];
    [self setNavigationBarWithAlpha:self.tableView.contentOffset.y / 100.0f];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self setNavigationBarTranslucent:NO];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZMDynamicCell" bundle:nil] forCellReuseIdentifier:@"DynamicCell"];  //股票
    [self.tableView registerNib:[UINib nibWithNibName:@"OtherDynamicCell" bundle:nil] forCellReuseIdentifier:@"cell"]; //话题
}


- (void)requestData
{
    [ZMDynamicModel requestDataWithParameter:nil inView:self.view scrollView:self.tableView success:^(NSArray *result) {
        
        [self reloadDataWithArray:result needNoDataBtn:NO];
        
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
        
        [self.navigationController pushViewController:tdvc animated:YES];
    }
}

#pragma mark -- ZMTableViewCellDelegate
- (void)reloadWithModel:(ZMDataModel *)model indexPath:(NSIndexPath *)indexPath
{
    [self.dataSource replaceObjectAtIndex:indexPath.row withObject:model];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self setNavigationBarWithAlpha:scrollView.contentOffset.y / 100.0f];
}


//Ask questions
- (IBAction)askHimClick:(UIButton *)sender {
    sender.selected = !sender.isSelected;
}


#pragma mark -- 点击头像
- (IBAction)touchIcon:(UIButton *)sender {
    
    [[ZMPhotoView photoView] alertControllerAboveIn:self imageView:_icon];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


@end
