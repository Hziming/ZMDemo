//
//  LiveViewController.m
//  JiuSeLu
//
//  Created by ddapp on 16/12/20.
//  Copyright © 2016年 wzw. All rights reserved.
//

#define KLineMinY 37
#define KLineHeight 1
#define KButtonNum self.viewControllers.count
//#define KLineWidth 100 * KSCALE_W
#define KLineWidth KVIEW_W / KButtonNum

#import "LiveViewController.h"

#import "ZMDynamicController.h"
#import "ZMSubscribeController.h"
#import "ZMQuestionsController.h"

@interface LiveViewController ()
{
    UIViewController *_currentViewController;
}

@property(nonatomic, strong) NSMutableArray *viewControllers;


@property (nonatomic, strong) UIView *line;
@property (weak, nonatomic) IBOutlet UIScrollView *contentView;
@property (weak, nonatomic) IBOutlet UIView *titleView;

@end

@implementation LiveViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSubController];

}



- (void)createSubController{
    
    ZMDynamicController *dvc = [[ZMDynamicController alloc] init];
    dvc.title = @"动态";
    
    ZMSubscribeController *svc = [[ZMSubscribeController alloc] init];
    svc.type = @"1";
    svc.title = @"订阅";
    
    ZMQuestionsController *qvc = [[ZMQuestionsController alloc] init];
    qvc.title = @"提问";
    
    self.viewControllers = [NSMutableArray arrayWithArray:@[dvc, svc, qvc]];
    

    _line = [[UIView alloc] initWithFrame:CGRectMake(0, KLineMinY, KLineWidth, KLineHeight)];
    _line.backgroundColor = [UIColor orangeColor];
    
    [_titleView addSubview:_line];
    
    [self.viewControllers enumerateObjectsUsingBlock:^(UIViewController *vc, NSUInteger idx, BOOL *stop) {
        
        vc.view.frame = CGRectMake(idx * KVIEW_W, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.contentView.frame));
        [self addChildViewController:vc];
        
        [self.contentView addSubview:vc.view];
        
        [vc didMoveToParentViewController:self];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(idx * KVIEW_W/KButtonNum, 0, KVIEW_W/KButtonNum, 40)];
        
        btn.selected = idx == 0;
        
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag = idx;
        [btn addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [_titleView addSubview:btn];
        
        [self.dataSource addObject:btn];
        
    }];
    
    _contentView.contentSize = CGSizeMake(KVIEW_W * self.viewControllers.count, 0);
    
    _currentViewController = [self.childViewControllers firstObject];
    
    [_currentViewController beginAppearanceTransition:YES animated:YES];
    
    [_currentViewController endAppearanceTransition];
    
}

- (void)change:(UIButton *)sender
{
    for (UIButton *btn in self.dataSource) {
        btn.selected = NO;
    }
    
    sender.selected = YES;
    
    [_contentView setContentOffset:CGPointMake(sender.tag * KVIEW_W, 0) animated:YES];
    
    [self changeController:sender.tag];
}


-(void)changeController:(NSInteger)idx;
{
    UIViewController *vc = self.childViewControllers[idx];
    
    if (vc != _currentViewController) {
        _currentViewController = vc;
        [vc beginAppearanceTransition:YES animated:YES];
        [vc endAppearanceTransition];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (KButtonNum > 0) {
        CGFloat idx = scrollView.contentOffset.x / (CGRectGetWidth(scrollView.frame) * 1.0);
        _line.frame = CGRectMake(idx * KVIEW_W/KButtonNum + ((KVIEW_W/KButtonNum) - KLineWidth)/2, KLineMinY, KLineWidth, KLineHeight);
    }
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / KVIEW_W;
    [self changeController:index];
    
    [self.dataSource enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.selected = NO;
        
        if (index == idx) {
            obj.selected = YES;
        }
        
    }];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
