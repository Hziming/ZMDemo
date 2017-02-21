//
//  ProblemDetailsController.m
//  JiuSeLu
//
//  Created by ddapp on 16/12/28.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import "ProblemDetailsController.h"
//#import "ZMUserInformationCell.h"
//#import "ChangeInfoController.h"

#import <Photos/Photos.h>

@interface ProblemDetailsController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *info;

@end

@implementation ProblemDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self removeRefresh];
}

/*
 content = jiushihihknxm;
 createTime = "2016-12-30 10:09:12";
 id = 7;
 nickName = Nick;
 userId = 2;
 */

- (void)requestData
{
    //API 和 参数自己到时候视情况而定
    [[ZMNetworking shareInstance] Get:K_TestUrl parameter:nil inView:self.view success:^(id responseObject) {

        //加载假数据。。。。。。
        NSString *path = [[NSBundle mainBundle] pathForResource:@"K_Live_ProblemDetail" ofType:@"plist"];
        
        responseObject = [[NSDictionary alloc] initWithContentsOfFile:path];
        // 实际情况删掉就好 ↑↑↑↑↑↑↑↑↑↑↑↑↑
        
        NSDictionary *dvInfo = responseObject[@"dvInfo"];

        [_icon sd_setImageWithURL:KIMAGE_TOOL(dvInfo[@"headImg"]) placeholderImage:K_DefaultImage];
        _nickName.text = dvInfo[@"nickName"];
        _info.text = dvInfo[@"info"];

        NSMutableArray *data = [NSMutableArray array];
        
        for (NSDictionary *list in responseObject[@"list"]) {
            
            CGFloat height = [Util returnLabelHeightForText:list[@"content"] labelWidth:KVIEW_W - 32 fontSize:16];

            ZMDataModel *model = [[ZMDataModel alloc] initWithDic:list rowHeight:105 - 42 + height identifier:@"cell"];
            
            [data addObject:model];
        }
        
        [self reloadDataWithArray:data];

        
    } failure:^(NSError *error) {
        
    }];
}



@end
