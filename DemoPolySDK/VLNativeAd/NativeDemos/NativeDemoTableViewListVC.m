//
//  NativeDemoTableViewListVC.m
//  VlionAdSDK_3000
//
//  Created by yangting on 2020/6/30.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "NativeDemoTableViewListVC.h"
#import <VLionADSDK/VLNADSDK.h>
#import "NativeNewsNormalModel.h"
#import "NativeNewsNormalCell.h"

@interface NativeDemoTableViewListVC ()<UITableViewDelegate, UITableViewDataSource, VLNNativeAdDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSMutableArray *nativeAdArr;

@end

@implementation NativeDemoTableViewListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArr = [NSMutableArray array];
    self.nativeAdArr = [NSMutableArray array];
    
    [self loadNews];
    [self loadAd];
}

- (void)loadAd {
    for (int i = 0; i < 7; i++) {
        VLNNativeAd *ad = [[VLNNativeAd alloc] initWithTagId:@"23798"
                                                      adSize:CGSizeMake(UIScreen.mainScreen.bounds.size.width, 0)
                                                    delegate:self
                                              viewController:self];
        
        [ad loadAd];
        [self.nativeAdArr addObject:ad];
    }
}

- (void)loadNews {
    NSString *feedPath = [[NSBundle mainBundle] pathForResource:@"nativeNews" ofType:@"json"];
    NSString *s = [NSString stringWithContentsOfFile:feedPath encoding:NSUTF8StringEncoding error:nil];
    NSArray *datas = [self objectFromJSONString:s];
    
    for (NSDictionary *dict in datas) {
        NativeNewsNormalModel *model = [[NativeNewsNormalModel alloc]initWithDict:dict];
        [self.dataArr addObject:model];
    }
    for (int i = 0; i < datas.count; i++) {
        NSUInteger index = rand() % (datas.count-3)+2;
        NativeNewsNormalModel *model = [[NativeNewsNormalModel alloc]initWithDict:[datas objectAtIndex:index]];
        [self.dataArr addObject:model];
    }
    [self.tableView reloadData];
}

/**
 *  原生广告加载广告数据成功回调，返回为VLionNativeAdModel对象
 */
- (void)vl_nativeAdDidLoadSuccess:(VLNNativeAd *)nativeAd nativeAdModels:(NSArray<VLNativeAdInfo *> *)nativeAdModels {
    NSUInteger index = arc4random()%self.dataArr.count;
    [self.dataArr insertObject:nativeAdModels.firstObject atIndex:index];
    [self.tableView reloadData];
    NSLog(@"---------加载成功");
}

- (void)vl_nativeAdDidLoadSuccess:(VLNNativeAd *)nativeAd nativeAds:(NSArray<VLNativeAdInfo *> *)nativeAds {
    NSUInteger index = arc4random()%self.dataArr.count;
    [self.dataArr insertObject:nativeAds.firstObject atIndex:index];
    [self.tableView reloadData];
    NSLog(@"---------加载成功");
}

/**
 *  原生广告加载广告数据失败回调
 */
- (void)vl_nativeAd:(VLNNativeAd *)nativeAd didFailWithError:(NSError *)error {
    NSLog(@"---------加载失败");
}

/**
 广告曝光回调
 */
- (void)vl_nativeAdExposured:(VLNNativeAd *)nativeAd {
    [self.tableView reloadData];
}

/**
 广告点击回调
 */
- (void)vl_nativeAdDidClick:(VLNNativeAd *)nativeAd {
    
}

/**
 广告点击关闭
 */
- (void)vl_nativeAdDidClickClose:(VLNNativeAd *)nativeAd {
    
}

#pragma mark --UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id model = self.dataArr[indexPath.row];
    if ([model isKindOfClass:[NativeNewsNormalModel class]]) {
        NSString *clazz = [self classNameWithCellType:[(NativeNewsNormalModel *)model type]];
        NativeNewsNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:clazz];
        if(!cell){
            cell = [(NativeNewsNormalCell *)[NSClassFromString(clazz) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:clazz];
        }
        if (indexPath.row == 0) {
            cell.separatorLine.hidden = YES;
        }
        [cell refreshUIWithModel:model];
        return cell;
    }
    else if([model isKindOfClass:[VLNativeAdInfo class]]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"UITableViewCell"];
            UIView *renderV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, cell.contentView.bounds.size.height)];
            renderV.tag = 10000;
            [cell.contentView addSubview:renderV];
        }
        UIView *renderV = [cell.contentView viewWithTag:10000];
        VLNativeAdInfo *info = (VLNativeAdInfo *)model;
        renderV.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, info.adSize.height);
        [info renderToView:renderV];
        return cell;
    }
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = @"不知道什么类型";
    return cell;
}

- (NSString *)classNameWithCellType:(NSString *)type {
    if ([type isEqualToString: @"title"]) {
        return @"NativeNewsNormalCell";
    }else if ([type isEqualToString: @"titleImg"]){
        return @"BUDFeedNormalTitleImgTableViewCell";
    }else if ([type isEqualToString: @"bigImg"]){
        return @"BUDFeedNormalBigImgTableViewCell";
    }else if ([type isEqualToString: @"threeImgs"]){
        return @"BUDFeedNormalthreeImgsableViewCell";
    }else{
        return @"unkownCell";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = self.dataArr[indexPath.row];
    if ([model isKindOfClass:[NativeNewsNormalModel class]]) {
        return [(NativeNewsNormalModel *)model cellHeight];
    }
    else if ([model isKindOfClass:[VLNativeAdInfo class]]) {
        VLNativeAdInfo *info = (VLNativeAdInfo *)model;
        return info.adSize.height;
    }
    return 100;
}


- (id)objectFromJSONString:(NSString *)s {
    NSData *data = [s dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

@end
