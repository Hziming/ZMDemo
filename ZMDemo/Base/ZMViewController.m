//
//  ZMViewController.m
//  ZMDemo
//
//  Created by ddapp on 17/1/12.
//  Copyright © 2017年 Hzming. All rights reserved.
//




#import "ZMViewController.h"

@interface ZMViewController ()
{
    UIImage *_shadowImage;
}
@end

@implementation ZMViewController

- (NSMutableArray *)dataSource
{
    if (_dataSource == nil)
    {
        _dataSource = [[NSMutableArray alloc] init];
    }
    
    return _dataSource;
}


- (NSMutableDictionary *)parameter
{
    if (_parameter == nil) {
        _parameter = [NSMutableDictionary dictionary];
    }
    return _parameter;
}


- (UIButton *)noDataBtn
{
    if (_noDataBtn == nil) {
        _noDataBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _noDataBtn.frame = CGRectMake(0, 0, 100, 100);
        _noDataBtn.center = self.view.center;
        [_noDataBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_noDataBtn setTitle:@"暂无内容~" forState:UIControlStateNormal];
        [_noDataBtn setBackgroundImage:[UIImage imageNamed:@"icon62"] forState:UIControlStateNormal];
        _noDataBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    }
    return _noDataBtn;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createNavagation];
    
    
}


#pragma mark -创建导航栏
- (void)createNavagation{
    
    if (self.navigationController.viewControllers.count > 1) {
        if (self.navigationController && !self.navigationController.isNavigationBarHidden ) {
            
            //            UIImage *image = [[UIImage imageNamed:@"icon12"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            UIImage *image = [UIImage imageNamed:@"icon12"];
            
            UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(back)];
            
            self.navigationItem.leftBarButtonItem = back;
        }
    }
    
    _shadowImage = self.navigationController.navigationBar.shadowImage;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor blackColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
}



- (void)requestData
{
    /**
     *  该方法由子类自行实现，父类不做实现
     */
}


- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)setNavigationBarTranslucent:(BOOL)translucent{
    
    if (self.navigationController == nil) return;
    
    if (translucent) {
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
        
        self.navigationController.navigationBar.translucent = YES ;
        
        [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:RGBA(0, 0, 0, 0)] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[self imageWithBgColor:RGBA(0, 0, 0, 0)]];
        
    } else {
        self.navigationController.navigationBar.tintColor = [UIColor lightGrayColor];
        
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor blackColor]}];
        
        self.navigationController.navigationBar.translucent = NO;
        
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        [self.navigationController.navigationBar setShadowImage:_shadowImage];
    }
    
    
}

- (void)setNavigationBarWithAlpha:(CGFloat)alpha{
    
    if (alpha < 0.1) {
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
        [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:RGBA(0, 0, 0, 0)] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[self imageWithBgColor:RGBA(0, 0, 0, 0)]];
        
    } else if (alpha > 0.1) {
        self.navigationController.navigationBar.tintColor = [UIColor lightGrayColor];
        
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor blackColor]}];
        [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:RGBA(255, 255, 255, alpha)] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:_shadowImage];
        
    }
    
}


-(UIImage *)imageWithBgColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}


- (void)dealloc
{
    NSLog(@"%@  -> 销毁 ====", self.class);
}



@end
