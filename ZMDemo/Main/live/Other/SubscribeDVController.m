//
//  SubscribeDVController.m
//  JiuSeLu
//
//  Created by ddapp on 16/12/24.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import "SubscribeDVController.h"
#import "ZMSubscribeCell.h"


@interface SubscribeDVController ()

@property (weak, nonatomic) IBOutlet UIButton *recommendedBtn;
@property (weak, nonatomic) IBOutlet UIButton *profitAndLossBtn;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

//搜索类型View 的高
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchTypeViewHeight;

@end

@implementation SubscribeDVController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [IQKeyboardManager sharedManager].enable = NO;
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [IQKeyboardManager sharedManager].enable = YES;

}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = 145;
    [self.tableView registerNib:[UINib nibWithNibName:@"ZMSubscribeCell" bundle:nil] forCellReuseIdentifier:@"cell"];}

- (void)requestData
{
    [self.parameter setObject:@(self.start) forKey:@"st"];
    
    [self.parameter setObject:@"0" forKey:@"t"];
    
    [[ZMNetworking shareInstance] Get:@"" parameter:self.parameter inView:nil scrollView:self.tableView success:^(id responseObject) {

 
        
        
        [self reloadDataWithArray:responseObject[@"list"]];
        
    } failure:^(NSError *error) {
        NSLog(@"订阅error");
        
    }];
}


#pragma mark <ZMSubscribeDelegate>
- (void)concernDV:(NSNumber *)dvId {
    
    [[ZMNetworking shareInstance] Get:@"" parameter:self.parameter inView:nil scrollView:self.tableView success:^(id responseObject) {
        
        [SVProgressHUD showSuccessWithStatus:@"关注成功"];
        
        self.down = YES;
        
        [self requestData];
        
    } failure:^(NSError *error) {
        
    }];
}


- (IBAction)searchClick:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
    
    _searchTextField.hidden = !sender.isSelected;
    
    sender.isSelected ? [_searchTextField becomeFirstResponder] : [_searchTextField resignFirstResponder];
    
    _searchTypeViewHeight.constant = sender.isSelected ? 0 : 35;

    [UIView animateWithDuration:0.3 animations:^{
        
        [self.view layoutIfNeeded];
    }];
    
}

- (IBAction)searchTypeClick:(UIButton *)sender {
    
    _recommendedBtn.selected = _profitAndLossBtn.selected = NO;
    
    sender.selected = YES;
    
}


- (IBAction)back:(UIButton *)sender {
    
    [self back];
}



@end
