//
//  ZMDynamicCell.m
//  JiuSeLu
//
//  Created by ddapp on 16/12/20.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import "ZMDynamicCell.h"

@interface ZMDynamicCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *createTime;

@property (weak, nonatomic) IBOutlet UILabel *stockName;
@property (weak, nonatomic) IBOutlet UILabel *stockNo;
@property (weak, nonatomic) IBOutlet UILabel *buyIn;

@end



@implementation ZMDynamicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)paddingDataModel:(ZMDataModel *)model indexPath:(NSIndexPath *)indexPath delegate:(id)delegate
{
    _model = (ZMDynamicModel *)model;
    
    //    [_icon sd_setImageWithURL:KIMAGE_TOOL(_model.headImg) placeholderImage:K_DefaultImage];
    
    _title.text = [NSString stringWithFormat:@"%@买入了股票", _model.nickName];
    
    _createTime.text = _model.createTime;
    
    _stockName.text = _model.stockName;
    
    _stockNo.text = _model.stockNo;
    
    _buyIn.text = _model.buyIn;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
