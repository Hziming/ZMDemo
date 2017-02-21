//
//  UITableViewCell+PaddingData.h
//  ZMProjectDemo
//
//  Created by ddapp on 16/10/15.
//  Copyright © 2016年 Hzming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (PaddingData)

- (void)paddingDataModel:(ZMDataModel *)model indexPath:(NSIndexPath *)indexPath delegate:(id)delegate;


@end
