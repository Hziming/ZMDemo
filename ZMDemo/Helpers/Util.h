//
//  Util.h
//  YuanJu
//
//  Created by sigxui－001 on 1/14/16.
//  Copyright © 2016 sigxui－001. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Util : NSObject

//设置不同字体颜色
+(void)setTextColor:(UILabel *)label Index:(int)index AndColor:(UIColor *)vaColor;

+ (void) addClickEvent:(id)target action:(SEL)action owner:(UIView *)view;//添加单击手势

+ (void)makeCorner:(CGFloat)corner view:(UIView *)view;//给某个控件设圆角
//边框
+(void)makeCorner:(CGFloat)corner view:(UIView *)view color:(UIColor *)color;

//控件边缘灰色线条
+(void)setFoursides:(UIView *)view Direction:(NSString *)dirction sizeW:(CGFloat)sizew;

// 设置UILabel的不同颜色与大小
+ (void)setUILabel:(UILabel *)label Data:(NSString *)string SetData:(NSString *)setstring Color:(UIColor *)color Font:(CGFloat)font Underline:(BOOL)isbool;

+(CGFloat)ReturnViewFrame:(UIView *)view Direction:(NSString *)string;

/**
 *  动态计算行高
 *
 *  @param text     文本内容
 *  @param width    控件的宽
 *  @param fontSize 字体大小
 *
 *  @return 行高
 */
+(CGFloat)returnLabelHeightForText:(NSString *)text labelWidth:(CGFloat)width fontSize:(CGFloat)fontSize;



+(NSMutableAttributedString *)changeLabelWithText:(CGFloat)price leftFont:(NSInteger)leftFont rightFont:(NSInteger)rightFont;

+(NSMutableAttributedString *)changeLabelWithText:(CGFloat)price leftFont:(NSInteger)leftFont rightFont:(NSInteger)rightFont needLine:(BOOL)isNeed;

@end
