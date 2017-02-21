//
//  OtherDynamicCell.m
//  JiuSeLu
//
//  Created by ddapp on 16/12/27.
//  Copyright © 2016年 wzw. All rights reserved.
//

#import "OtherDynamicCell.h"
#import "PhotoItem.h"
#import "MWPhotoBrowser.h"
@interface OtherDynamicCell ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MWPhotoBrowserDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *createTime;
@property (weak, nonatomic) IBOutlet UIButton *ifCollectionBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *xxxLayout;//图片与文字的间隔
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentHeightLayout;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *browserPhotos;

@end


@implementation OtherDynamicCell

- (NSMutableArray *)browserPhotos
{
    if (!_browserPhotos) {
        _browserPhotos = [NSMutableArray array];
    }
    
    return _browserPhotos;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"PhotoItem" bundle:nil] forCellWithReuseIdentifier:@"item"];
}

- (void)paddingDataModel:(ZMDataModel *)model indexPath:(NSIndexPath *)indexPath delegate:(id)delegate
{
    self.delegate = delegate;
    
    self.indexPath = indexPath;
    
    _model = (ZMDynamicModel *)model;
    
    [_icon sd_setImageWithURL:KIMAGE_TOOL(_model.headImg) placeholderImage:K_DefaultImage];
    _name.text = [NSString stringWithFormat:@"%@发布了话题", _model.nickName];
    
    _title.text = _model.title;
    _createTime.text = _model.createTime;
    _ifCollectionBtn.selected = _model.ifCollection == 1;
    
    _content.text = _model.content;
    
    _contentHeightLayout.constant = _model.contentHeight;
    
    _xxxLayout.constant = _model.imgs.length > 0 ? 15.0f : 0;
    
    [self.browserPhotos removeAllObjects];
    
    for (NSString *imgStr in [_model.imgs componentsSeparatedByString:@","]) {
        
        [self.browserPhotos addObject:[MWPhoto photoWithURL:KIMAGE_TOOL(imgStr)]];
    };
    [self.collectionView reloadData];
}


#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_model.imgs componentsSeparatedByString:@","].count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    PhotoItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    
    NSString *imageStr = [_model.imgs componentsSeparatedByString:@","][indexPath.item];
    
    NSLog(@"imageStr -- %@%@", K_IMAGE_API,imageStr);
    [item.icon sd_setImageWithURL:KIMAGE_TOOL(imageStr) placeholderImage:K_DefaultImage];
    
    return item;
}

#pragma mark <UICollectionViewDelegate>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(_model.image_W, _model.image_W * 0.75);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *fvc = (UIViewController *)self.delegate;
    
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    
    browser.displayNavArrows = YES;
    
    [browser setCurrentPhotoIndex:indexPath.item];
    
    [browser showNextPhotoAnimated:YES];
    
    [fvc.navigationController pushViewController:browser animated:YES];

}

#pragma mark <MWPhotoBrowserDelegate>
//返回由多少张图片要显示
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser
{
    return self.browserPhotos.count;
}
//返回当前要显示的图片
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index
{
    if (index < self.browserPhotos.count) {
        return [self.browserPhotos objectAtIndex:index];
    }
    return nil;
}


#pragma mark --收藏按钮点击事件
- (IBAction)collectionClick:(UIButton *)sender {
    
    //这里是要调API的  先注释
    
//    sender.enabled = NO;
//    [[ZMNetworking shareInstance] Get:@"" parameter:@{@"topicId":@(_model.id)} success:^(id responseObject) {
//        
        _model.ifCollection = _model.ifCollection == 0 ? 1 : 0;
//
        if ([self.delegate respondsToSelector:@selector(reloadWithModel:indexPath:)]) {
            [self.delegate reloadWithModel:_model indexPath:self.indexPath];
        }
//
//        sender.enabled = YES;
//
//    } failure:^(NSError *error) {
//        sender.enabled = YES;
//
//    }];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
