//
//  ZMAlertView.h
//  ZMDemo
//
//  Created by ddapp on 17/1/12.
//  Copyright © 2017年 Hzming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMAlertView : NSObject

/**
 *  确定提示框
 *
 *  @param controller 当前控制器对象
 *  @param msg        提示框的内容
 *  @param OKTitle    确认按钮标题
 *  @param OKEvent    确认按钮执行的block
 */
+ (void)alertControllerAboveIn:(UIViewController *)controller
                   withMessags:(NSString *)msg
                       OKTitle:(NSString *)OKTitle
                       OKEvent:(void (^)())OKEvent;




/**
 *  自定义的提示框
 *
 *  @param controller   当前控制器对象
 *  @param title        提示框的标题
 *  @param msg          提示框的内容
 *  @param leftTitle    左边按钮的标题
 *  @param leftEvent    左边按钮执行的block
 *  @param rightTitle   右边按钮的标题
 *  @param rightEvent   右边按钮执行的block
 */
+(void)alertControllerAboveIn:(UIViewController *)controller
                     WithTitle:(NSString *)title
                           mgs:(NSString *)msg
                     leftTitle:(NSString *)leftTitle
                     leftEvent:(void(^)())leftEvent
                    rightTitle:(NSString *)rightTitle
                    rightEvent:(void(^)())rightEvent;



/**
 *  不加取消事件的带红色按钮的提示框
 *
 *  @param controller       当前控制器对象
 *  @param title            提示框的标题
 *  @param msg              提示框的内容
 *  @param destructiveTitle 红色按钮的标题
 *  @param desEvent         红色按钮执行的block
 *  @param cancelTitle      取消按钮的标题
 */
+(void)alertControllerAboveIn:(UIViewController *)controller
                     WithTitle:(NSString *)title
                           mgs:(NSString *)msg
              destructiveTitle:(NSString *)destructiveTitle
                      desEvent:(void(^)())desEvent
                   cancelTitle:(NSString *)cancelTitle;


/**
 *  有取消事件的带红色按钮的提示框
 *
 *  @param controller       当前控制器对象
 *  @param title            提示框的标题
 *  @param msg              提示框的内容
 *  @param destructiveTitle 红色按钮的标题
 *  @param desEvent         红色按钮执行的block
 *  @param cancelTitle      取消按钮的标题
 *  @param cancelTitle      取消按钮执行的block
 */
+(void)alertControllerAboveIn:(UIViewController *)controller
                     WithTitle:(NSString *)title
                           mgs:(NSString *)msg
              destructiveTitle:(NSString *)destructiveTitle
                      desEvent:(void(^)())desEvent
                   cancelTitle:(NSString *)cancelTitle
                   cancelEvent:(void(^)())cancelEvent;


/**
 *  底部 自定义标题的提示框
 *
 *  @param controller    当前控制器对象
 *  @param eventsName    事件名  用逗号隔开
 *  @param events        相册按钮执行的block
 */
+ (void)alertSheetControllerAboveIn:(UIViewController *)controller
                              title:(NSString *)title
                         eventsName:(NSString *)eventsName
                             events:(void (^)(NSInteger index))events;


@end
