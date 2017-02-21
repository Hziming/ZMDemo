//
//  ProblemDetailsCell.h
//  JiuSeLu
//
//  Created by ddapp on 16/12/28.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProblemDetailsModel;

@interface ProblemDetailsCell : UITableViewCell

@property (nonatomic, strong) ProblemDetailsModel *model;

@end


@interface ProblemDetailsModel : ZMDataModel;

@end
