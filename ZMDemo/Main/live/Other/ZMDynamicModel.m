//
//  ZMDynamicModel.m
//  JiuSeLu
//
//  Created by ddapp on 16/12/27.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import "ZMDynamicModel.h"
#import "Util.h"
@implementation ZMDynamicModel


+ (instancetype) initWithDic:(NSDictionary *)dic
{
    //整型 不赋初值 默认为 ‘0’
    return [ZMDynamicModel initWithDic:dic type:0];
}

+ (instancetype)initWithDic:(NSDictionary *)dic type:(NSInteger)type
{
    ZMDynamicModel *model = [ZMDynamicModel mj_objectWithKeyValues:dic];
    if (type != 0) {
        model.type = type;
    }
    
    model.rowHeight = 74 + 25;  //最少74   距离底部25.
    model.allHeight = 99 + 25;  //详情的高度
    
    //超过三行做判断  。。。    60已经超过三行了;  三行大概的高度是  51;
    CGFloat moreHeight = [Util returnLabelHeightForText:model.content labelWidth:KVIEW_W - 56 fontSize:14];
    
    model.allHeight += moreHeight;
    
    if (moreHeight > 60) {
        model.rowHeight += 51;
        model.contentHeight = 51;
    } else {
        model.rowHeight += moreHeight;
        model.contentHeight = moreHeight;
    }
    
    if (model.imgs.length > 0) {
        
        switch ([model.imgs componentsSeparatedByString:@","].count) {
            case 3:
            case 5:
            case 6:{
                CGFloat w = (KVIEW_W - 16 - 40) * 0.9;
                
                model.image_W = (w - 16) / 3.0;
                model.dynamic_image_W = (KVIEW_W - 32 - 16) / 3.0;
                
                //图片背景(collectionView)高度
                CGFloat h = model.image_W * 0.75;
                
                //有几排照片
                NSInteger n = ([model.imgs componentsSeparatedByString:@","].count + 2)/3;
                
                model.rowHeight += h * n + 8 * (n - 1)/*照片间隔*/ + 15 /*图片与文字的间隔*/;
                model.allHeight += model.dynamic_image_W * 0.75 * n + 8 * (n - 1)/*照片间隔*/ + 15 /*图片与文字的间隔*/;
            }
                break;
            case 2:
            case 4:{
                CGFloat w = (KVIEW_W - 16 - 40) * 0.9;
                
                model.image_W = (w - 8) / 2.0;
                model.dynamic_image_W = (KVIEW_W - 32 - 8) / 2.0;
                
                //图片背景(collectionView)高度
                CGFloat h = model.image_W * 0.75;
                
                //有几排照片
                NSInteger n = ([model.imgs componentsSeparatedByString:@","].count + 1)/2;
                
                model.rowHeight += h * n + 8 * (n - 1)/*照片间隔*/ + 15 /*图片与文字的间隔*/;
                model.allHeight += model.dynamic_image_W * 0.75 * n + 8 * (n - 1)/*照片间隔*/ + 15 /*图片与文字的间隔*/;
            }
                break;
                
            default:{
                CGFloat w = (KVIEW_W - 16 - 40) * 0.9;
                
                model.image_W = w;
                model.dynamic_image_W = (KVIEW_W - 32);
                
                //图片背景(collectionView)高度
                model.rowHeight += model.image_W * 0.75;
                
                model.allHeight += model.dynamic_image_W * 0.75;
                
            }
                break;
        }
        
    }
    
    
    
    switch (model.type) {
        case 1:         //话题
        case 2:
        case 999:       //收藏
            model.cellIdentifier = @"cell";
            break;
        case 3:         //股票
            model.cellIdentifier = @"DynamicCell";
            model.rowHeight = 116.0f;
            break;
        default:
            
            model.rowHeight = 116.0f;
            break;
    }
    
    return model;
}




+ (void)requestDataWithParameter:(NSDictionary *)parameter inView:(UIView *)view scrollView:(UIScrollView *)scrollView success:(void (^)(NSArray *result))success failure:(void (^)(NSError *))failure
{
    
    //API 和 参数自己到时候视情况而定
    [[ZMNetworking shareInstance] Post:K_TestUrl parameter:parameter inView:view scrollView:scrollView success:^(NSDictionary * responseObject) {
        
        //加载假数据。。。。。。
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Live_Dynamic" ofType:@"plist"];
        
        responseObject = [[NSDictionary alloc] initWithContentsOfFile:path];
        // 实际情况删掉就好 ↑↑↑↑↑↑↑↑↑↑↑↑↑
        
        NSMutableArray *data = @[].mutableCopy;
        
        for (NSDictionary *list in responseObject[@"list"]) {
            
            ZMDynamicModel *model = [ZMDynamicModel initWithDic:list];
            
            [data addObject:model];
        }
        
        success(data.copy);
        
    } failure:^(NSError *error) {
        failure(error);
    }];

}



@end
