//
//  GoodsListController.m
//  zmddm
//
//  Created by ddapp on 16/8/16.
//  Copyright © 2016年 Hzming. All rights reserved.
//

#import "GoodsListController.h"
#import "GoodsListItem.h"


@interface GoodsListController ()<UICollectionViewDelegateFlowLayout>

@end

@implementation GoodsListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


- (void)requestData
{
    [self.parameter setObject:@(self.start) forKey:@"st"];
    //                                  正式使用时 ↓  用self.parameter替换，即可实现上下拉刷新数据
    [HomeGoodsListModel requestDataWithParameter:nil inView:self.view scrollView:self.collectionView success:^(NSArray *result) {
       
        [self reloadDataWithArray:result];
        
    } failure:^(NSError *error) {
        
    }];
    
}

@end
