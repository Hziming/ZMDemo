//
//  ZMQuestionsCell.m
//  JiuSeLu
//
//  Created by ddapp on 16/12/20.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import "ZMQuestionsCell.h"
@interface ZMQuestionsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end

@implementation ZMQuestionsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)paddingDataModel:(ZMDataModel *)model indexPath:(NSIndexPath *)indexPath delegate:(id)delegate
{
    _model = (ZMQuestionsModel *)model;
    
    [_icon sd_setImageWithURL:KIMAGE_TOOL(_model.headImg) placeholderImage:K_DefaultImage];

    _name.text = _model.nickName;
    
    _title.text = _model.content;
    
    _content.text = _model.replyContent;
    
}




/*
 content = Dasdasdasdasdasdas;
 createTime = "2016-12-27 10:59:19";
 id = 5;
 nickName = Nick;
 parentId = 0;
 replyContent = Dasdasdasdasdasdas;
 userId = 5;
 
 id             问题ID
 content        内容
 userId         提问会员ID
 nickName       提问会员的昵称
 replyContent   回复的内容
 createTime     提问的时间
 parentId       非空表示追问,值表示上一个提问的内容
 
 */

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end




@implementation ZMQuestionsModel

+ (instancetype)setupDataWithDic:(NSDictionary *)dic
{
    ZMQuestionsModel *model = [ZMQuestionsModel mj_objectWithKeyValues:dic];
    
    if (model.replyContent.length == 0) {
        model.nickName = [NSString stringWithFormat:@"%@暂未回复你的提问", model.nickName];
    } else {
        model.nickName = [NSString stringWithFormat:@"%@回复了你的提问", model.nickName];
    }
    
    //  默认161   没有回复不显示回复内容
    if (model.replyContent.length == 0) {
        model.rowHeight = 96;// 8 + 51 + 21 + 8 + 8
    } else {
        model.replyContent = [NSString stringWithFormat:@"[回复内容] %@", model.replyContent];
        
        model.rowHeight = 161 - 52;
        //超过三行做判断  。。。    60已经超过三行了;  三行大概的高度是  52;
        CGFloat moreHeight = [Util returnLabelHeightForText:model.replyContent labelWidth:KVIEW_W - 56 fontSize:14];
        
        if (moreHeight > 60) {
            model.rowHeight += 52;
        } else {
            model.rowHeight += moreHeight;
        }
    }
    model.cellIdentifier = @"cell";
    
    return model;
}



+ (void)requestDataWithParameter:(NSDictionary *)parameter inView:(UIView *)view scrollView:(UIScrollView *)scrollView success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    [[ZMNetworking shareInstance] Post:K_TestUrl parameter:parameter inView:view scrollView:scrollView success:^(id responseObject) {
        
        //加载假数据。。。。。。
        NSString *path = [[NSBundle mainBundle] pathForResource:@"K_Uc_Problem" ofType:@"plist"];
        
        responseObject = [[NSDictionary alloc] initWithContentsOfFile:path];
        // 实际情况删掉就好 ↑↑↑↑↑↑↑↑↑↑↑↑↑
        
        NSMutableArray *data = @[].mutableCopy;
        
        for (NSDictionary *list in responseObject[@"list"]) {
            
            ZMQuestionsModel *model = [ZMQuestionsModel setupDataWithDic:list];
            
            [data addObject:model];
        }
        success(data.copy);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}



@end







