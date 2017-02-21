//
//  Util.m
//  YuanJu
//
//  Created by sigxui－001 on 1/14/16.
//  Copyright © 2016 sigxui－001. All rights reserved.
//

#import "Util.h"
@implementation Util

//设置不同字体颜色
+(void)setTextColor:(UILabel *)label Index:(int)index AndColor:(UIColor *)vaColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:label.text];
    
    //截取的范围
    NSString *InterceptStr = [NSString stringWithFormat:@"%@",[label.text substringFromIndex:index]];
    
    //获取改变的内容
    NSRange range = [label.text rangeOfString:InterceptStr];
    
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    
    label.attributedText = str;
}


+ (void) addClickEvent:(id)target action:(SEL)action owner:(UIView *)view{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    gesture.numberOfTouchesRequired = 1;
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:gesture];
}


+ (void)setUILabel:(UILabel *)label Data:(NSString *)string SetData:(NSString *)setstring Color:(UIColor *)color Font:(CGFloat)font Underline:(BOOL)isbool{
    
    
    NSRange str = [label.text rangeOfString:setstring];
    if (str.location != NSNotFound) {
        
        NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:label.text];
        [str1 addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(string.length,setstring.length)]; //设置字体颜色
        [str1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:NSMakeRange(string.length,setstring.length)];
        if (isbool) {
            
            [str1 addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(string.length,setstring.length)];
        }
        
        label.attributedText = str1;        
    }
    
}

+ (void)makeCorner:(CGFloat)corner view:(UIView *)view{
    CALayer *layer = view.layer;
    layer.cornerRadius = corner;
    layer.masksToBounds = YES;
}

#pragma mark 边框
+(void)makeCorner:(CGFloat)corner view:(UIView *)view color:(UIColor *)color{
    
    CALayer * fileslayer = [view layer];
    fileslayer.borderColor = [color CGColor];
    fileslayer.borderWidth = corner;
    
}

+(CGFloat)ReturnViewFrame:(UIView *)view Direction:(NSString *)string{

    if ([string  isEqual: @"Y"]) {
        
        return view.frame.origin.y + view.frame.size.height;
        
    }else{
    
        return view.frame.origin.x + view.frame.size.width;
    }
}

#pragma mark 底部灰色线条
+(void)setFoursides:(UIView *)view Direction:(NSString *)dirction sizeW:(CGFloat)sizew{
    
    if ([dirction  isEqual: @"left"]) {
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.8, sizew)];
        bottomview.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
        [view addSubview:bottomview];
        
    }else if([dirction  isEqual: @"right"]){
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width - 0.5, 0, 0.5, sizew)];
        bottomview.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
        [view addSubview:bottomview];
        
    }else if([dirction  isEqual: @"top"]){
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sizew, 0.5)];
        bottomview.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
        [view addSubview:bottomview];
        
    }else if([dirction  isEqual: @"bottom"]){
        
        UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height - 0.5, sizew, 0.5)];
        bottomview.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0];
        [view addSubview:bottomview];
    }
}

+(CGFloat)returnLabelHeightForText:(NSString *)text labelWidth:(CGFloat)width fontSize:(CGFloat)fontSize{
    //动态计算行高
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    NSDictionary *attrs = @{NSFontAttributeName:font};
    
    //label x:20 y:0 w:280 h:44
    //font 15
    CGRect bounds = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
    
    return bounds.size.height;
}




//创建一个返回富文本的方法
+(NSMutableAttributedString *)changeLabelWithText:(CGFloat)price leftFont:(NSInteger)leftFont
                                         rightFont:(NSInteger)rightFont
{
    return [Util changeLabelWithText:price leftFont:leftFont rightFont:rightFont needLine:NO];
    
}


+(NSMutableAttributedString *)changeLabelWithText:(CGFloat)price leftFont:(NSInteger)leftFont rightFont:(NSInteger)rightFont needLine:(BOOL)isNeed
{
    NSString *needText = [NSString stringWithFormat:@"￥%.2f", price];;
    
    NSRange needRange = [needText rangeOfString:@"."];
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:needText];
    
    
    if (isNeed) {
        NSDictionary *attrDict1 = @{NSStrikethroughColorAttributeName: [UIColor lightGrayColor],                                NSStrikethroughStyleAttributeName: @(1)};
        //,                                //NSFontAttributeName: [UIFont systemFontOfSize:leftFont]};
        
        [attrString addAttributes:attrDict1 range:NSMakeRange(0,needText.length)];
    }
    
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:leftFont] range:NSMakeRange(0,needRange.location)];
    
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:rightFont] range:NSMakeRange(needRange.location ,needText.length-needRange.location)];
    
    
    return attrString;
}

@end
