//
//  MyCollectionCell.m
//  zmddm
//
//  Created by ddapp on 16/8/4.
//  Copyright © 2016年 Hzming. All rights reserved.
//

#import "MyCollectionCell.h"

@interface MyCollectionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;

@end

@implementation MyCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)paddingDataModel:(ZMDataModel *)model indexPath:(NSIndexPath *)indexPath delegate:(id)delegate
{

    _model = (MyCollectionModel *)model;
    
    self.indexPath = indexPath;
    
    self.delegate = delegate;
    
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://static.mall.jxezt.cn/%@", _model.headImg]];
    [_icon sd_setImageWithURL:imageUrl placeholderImage:K_DefaultImage];
    
    _name.text = _model.name;
    
    [_price setAttributedText:[Util changeLabelWithText:_model.price leftFont:15 rightFont:12]];
    
}



- (IBAction)delectClick:(UIButton *)sender {

    if ([self.delegate respondsToSelector:@selector(removeWithModel:indexPath:)]) {
        [self.delegate removeWithModel:_model indexPath:self.indexPath];
    }
}

@end



@implementation MyCollectionModel

+ (instancetype)setupDataWithDic:(NSDictionary *)dic
{
    MyCollectionModel *model = [MyCollectionModel mj_objectWithKeyValues:dic];
    model.cellIdentifier = @"cell";
    model.rowHeight = 90;
    
    return model;
}


+(void)requestDataWithParameter:(NSDictionary *)parameter inView:(UIView *)view scrollView:(UIScrollView *)scrollView success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    [[ZMNetworking shareInstance] Post:K_TestUrl parameter:parameter inView:view scrollView:scrollView success:^(id responseObject) {
        
        //加载假数据。。。。。。
        NSString *path = [[NSBundle mainBundle] pathForResource:@"K_Collection_List" ofType:@"plist"];
        
        responseObject = [[NSDictionary alloc] initWithContentsOfFile:path];
        // 实际情况删掉就好 ↑↑↑↑↑↑↑↑↑↑↑↑↑
        
        NSMutableArray *data = @[].mutableCopy;
        
        for (NSDictionary *list in responseObject[@"list"]) {
            
            MyCollectionModel *model = [MyCollectionModel setupDataWithDic:list];
            [data addObject:model];
        }
        success(data.copy);
        
    } failure:^(NSError *error) {
        failure(error);
    }];

}


@end








