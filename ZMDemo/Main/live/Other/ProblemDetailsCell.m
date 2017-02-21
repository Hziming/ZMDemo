//
//  ProblemDetailsCell.m
//  JiuSeLu
//
//  Created by ddapp on 16/12/28.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import "ProblemDetailsCell.h"

@interface ProblemDetailsCell ()

@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *celltype;

@end

@implementation ProblemDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)paddingDataModel:(ZMDataModel *)model indexPath:(NSIndexPath *)indexPath delegate:(id)delegate
{
    _model = (ProblemDetailsModel *)model;
    
    _content.text = _model.dicModel[@"content"];
    
    if (_model.dicModel[@"reply"]) {  //如果是大V回复的
        
    } else {
        
    }
    
}

/*
 id
 content
 userId
 nickName
 createTime
 reply          回复内容 (格式跟 id,content,userId(大V),nickname(大V的昵称))
 */

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end



@implementation ProblemDetailsModel

+(void)requestDataWithParameter:(NSDictionary *)parameter inView:(UIView *)view scrollView:(UIScrollView *)scrollView success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    
}

@end


