//
//  ZMAlertView.m
//  ZMDemo
//
//  Created by ddapp on 17/1/12.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import "ZMAlertView.h"

@implementation ZMAlertView


+ (void)alertControllerAboveIn:(UIViewController *)controller withMessags:(NSString *)msg OKTitle:(NSString *)OKTitle OKEvent:(void (^)())OKEvent
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok=[UIAlertAction actionWithTitle:OKTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if (OKEvent) {
            OKEvent();
        }
    }];
    
    [alert addAction:ok];
    [controller presentViewController:alert animated:YES completion:nil];
    
}


+ (void)alertControllerAboveIn:(UIViewController *)controller WithTitle:(NSString *)title mgs:(NSString *)msg leftTitle:(NSString *)leftTitle leftEvent:(void (^)())leftEvent rightTitle:(NSString *)rightTitle rightEvent:(void (^)())rightEvent
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *left = [UIAlertAction actionWithTitle:leftTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        leftEvent();
    }];
    
    UIAlertAction *right=[UIAlertAction actionWithTitle:rightTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        rightEvent();
    }];
    
    [alert addAction:left];
    [alert addAction:right];
    
    [controller presentViewController:alert animated:YES completion:nil];
    
}



+ (void)alertControllerAboveIn:(UIViewController *)controller WithTitle:(NSString *)title mgs:(NSString *)msg destructiveTitle:(NSString *)destructiveTitle desEvent:(void (^)())desEvent cancelTitle:(NSString *)cancelTitle;
{
   [ZMAlertView alertControllerAboveIn:controller WithTitle:title mgs:msg destructiveTitle:destructiveTitle desEvent:desEvent cancelTitle:cancelTitle cancelEvent:nil];
}



+ (void)alertControllerAboveIn:(UIViewController *)controller WithTitle:(NSString *)title mgs:(NSString *)msg destructiveTitle:(NSString *)destructiveTitle desEvent:(void (^)())desEvent cancelTitle:(NSString *)cancelTitle cancelEvent:(void (^)())cancelEvent
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *destructive = [UIAlertAction actionWithTitle:destructiveTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        desEvent();
    }];
    
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        cancelEvent();
    }];
    
    [alert addAction:destructive];
    [alert addAction:cancel];
    
    [controller presentViewController:alert animated:YES completion:nil];
}







+ (void)alertSheetControllerAboveIn:(UIViewController *)controller title:(NSString *)title eventsName:(NSString *)eventsName events:(void (^)(NSInteger index))events
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:title preferredStyle:UIAlertControllerStyleActionSheet];
    
    [[eventsName componentsSeparatedByString:@","] enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            events(idx);
        }];
        
        [alert addAction:action];
        
    }];
    
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    
    [controller presentViewController:alert animated:YES completion:nil];
    
}



@end
