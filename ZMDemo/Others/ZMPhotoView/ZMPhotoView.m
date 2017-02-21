//
//  ZMPhotoView.m
//  DdmERP
//
//  Created by ddapp on 16/10/25.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import "ZMPhotoView.h"

@interface ZMPhotoView ()<UIScrollViewDelegate>
{
    CGFloat _currentScale;
}

@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;

@property (nonatomic) CGRect beginRect;

@end


@implementation ZMPhotoView


+ (ZMPhotoView *)photoView
{
//    static ZMPhotoView *alert;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        if (alert == nil)
//        {
//            alert = [[NSBundle mainBundle]loadNibNamed:@"ZMPhotoView" owner:nil options:nil][0];
//            alert.frame = CGRectMake(0, 0, KVIEW_W, KVIEW_H);
//        }
//    });
//    return alert;
    
    return [[NSBundle mainBundle]loadNibNamed:@"ZMPhotoView" owner:nil options:nil][0];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.frame = CGRectMake(0, 0, KVIEW_W, KVIEW_H);
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    
    
    self.scrollerView.delegate = self;
//    self.scrollerView.frame = CGRectMake(0, 0, KVIEW_W, KVIEW_H);
    
    self.scrollerView.minimumZoomScale = 0.5; //缩放到最小为原图的几倍
    self.scrollerView.maximumZoomScale = KVIEW_H / KVIEW_W;  //放大到最大为原图的几倍
}


- (void)alertControllerAboveIn:(UIViewController *)controller imageView:(UIImageView *)imageView{

    self.photo.frame = self.beginRect = [imageView convertRect:imageView.bounds toView:controller.view.window];
    
//    NSLog(@"%@", NSStringFromCGRect(self.beginRect));
    
    
    self.photo.image = imageView.image;
    
    [UIView animateWithDuration:0.3 animations:^{
    
        
        self.photo.bounds = CGRectMake(0, 0, KVIEW_W, KVIEW_W);

        self.photo.center = self.scrollerView.center;

        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.9];
        NSLog(@"self.photo.frame -- %@", NSStringFromCGRect(self.photo.frame));


    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES];

    }];
    
    [controller.view.window addSubview:self];

}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale
{
//    NSLog(@"%@", [view class]);
//    
    NSLog(@"%f", scale);

    [UIView animateWithDuration:0.3 animations:^{
        self.photo.center = self.scrollerView.center;
        
        if (scale > 1.0) {
        self.photo.left = 0;
        }
    }];
    
    NSLog(@"%@", NSStringFromCGRect(self.photo.frame));

}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.photo;
}




- (IBAction)hiddenSelf:(UITapGestureRecognizer *)sender {
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    [self.scrollerView setZoomScale:1 animated:YES];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.photo.frame = self.beginRect;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
