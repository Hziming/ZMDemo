//
//  GoodsListItem.m
//  zmddm
//
//  Created by ddapp on 16/8/16.
//  Copyright © 2016年 Hzming. All rights reserved.
//

#import "GoodsListItem.h"

@interface GoodsListItem ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *sales;


@end

@implementation GoodsListItem


-(void)paddingDataModel:(ZMDataModel *)model indexPath:(NSIndexPath *)indexPath delegate:(id)delegate
{
    _model = (HomeGoodsListModel *)model;
    
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://static.mall.jxezt.cn/%@", _model.headImg]];
    [_icon sd_setImageWithURL:imageUrl placeholderImage:K_DefaultImage];

    _name.text = _model.name;
    
    [_price setAttributedText:[Util changeLabelWithText:_model.price leftFont:15 rightFont:12]];
    
    _sales.text = [NSString stringWithFormat:@"销量:%ld", _model.sales];
}

@end



@implementation HomeGoodsListModel


+ (instancetype)setupDataWithDic:(NSDictionary *)dic
{
    HomeGoodsListModel *model = [HomeGoodsListModel mj_objectWithKeyValues:dic];
    model.cellIdentifier = @"cell";
    model.itemSize = CGSizeMake((KVIEW_W - 3) / 2.0, (KVIEW_W - 3) / 2.0 * 1.3);
    return model;
}


+ (void)requestDataWithParameter:(NSDictionary *)parameter inView:(UIView *)view scrollView:(UIScrollView *)scrollView success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    [[ZMNetworking shareInstance] Post:K_TestUrl parameter:parameter inView:view scrollView:scrollView success:^(id responseObject) {
        
        //加载假数据。。。。。。
        NSString *path = [[NSBundle mainBundle] pathForResource:@"K_Goods_List" ofType:@"plist"];
        
        responseObject = [[NSDictionary alloc] initWithContentsOfFile:path];
        // 实际情况删掉就好 ↑↑↑↑↑↑↑↑↑↑↑↑↑
        
        NSMutableArray *data = @[].mutableCopy;
        
        for (NSDictionary *list in responseObject[@"list"]) {
            
            HomeGoodsListModel *model = [HomeGoodsListModel setupDataWithDic:list];
            
            [data addObject:model];
        }
        success(data.copy);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}

@end
