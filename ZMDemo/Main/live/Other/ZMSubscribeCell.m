//
//  ZMSubscribeCell.m
//  JiuSeLu
//
//  Created by ddapp on 16/12/20.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import "ZMSubscribeCell.h"

@interface ZMSubscribeCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *info;

@property (weak, nonatomic) IBOutlet UIButton *ifSubscribe;


@end

/*
 headImg = "user_img/20161224/1482573794711528553.jpg";
 id = 1;
 ifSubscribe = 1;   //是否已订阅了该大V  0未订阅
 info = "\U653e i \U90fd\U662f v \U770b\U89c1\U4ee8\U53d1\U591a\U5c11\U53d1\U591a\U5c11\U5206\U6492";
 name = "\U9886\U60c5";
 */
@implementation ZMSubscribeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)paddingDataModel:(ZMDataModel *)model indexPath:(NSIndexPath *)indexPath delegate:(id)delegate
{
    _model = (ZMSubscribeCellModel *)model;
    
    self.delegate = delegate;
    
    [_icon sd_setImageWithURL:KIMAGE_TOOL(_model.dicModel[@"headImg"]) placeholderImage:K_DefaultImage];
    
    _name.text = _model.dicModel[@"name"];
    
    _info.text = _model.dicModel[@"info"];
    
    _ifSubscribe.hidden = [_model.dicModel[@"ifSubscribe"] isEqualToNumber:@(1)];
}


- (IBAction)concernClick:(UIButton *)sender {


}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end



@implementation ZMSubscribeCellModel


+ (void)requestDataWithParameter:(NSDictionary *)parameter inView:(UIView *)view scrollView:(UIScrollView *)scrollView success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    //API 和 参数自己到时候视情况而定
    [[ZMNetworking shareInstance] Get:K_TestUrl parameter:parameter inView:view scrollView:scrollView success:^(id responseObject) {
        
        //加载假数据。。。。。。
        NSString *path = [[NSBundle mainBundle] pathForResource:@"K_Live_DvList" ofType:@"plist"];
        
        responseObject = [[NSDictionary alloc] initWithContentsOfFile:path];
        // 实际情况删掉就好 ↑↑↑↑↑↑↑↑↑↑↑↑↑
        
        NSMutableArray *data = @[].mutableCopy;

        for (NSDictionary *list in responseObject[@"list"]) {
            
            ZMSubscribeCellModel *model = [[ZMSubscribeCellModel alloc] initWithDic:list rowHeight:145 identifier:@"cell"];
            
            [data addObject:model];
        }
        success(data.copy);

    } failure:^(NSError *error) {
        
    }];
}

@end


