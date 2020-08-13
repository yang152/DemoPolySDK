//
//  DrawNativeViewController.m
//  AppDemo
//
//  Created by yangting on 2020/5/29.
//  Copyright © 2020 zhulin. All rights reserved.
//

#import "DrawNativeViewController.h"
#import <VLionADSDK/VLNDrawAd.h>
#import "DrawAdCell.h"

@interface DrawNativeViewController ()<VLNDrawAdDelegate, UIGestureRecognizerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) VLNDrawAd *ad;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *contentArr;
@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation DrawNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tagId = @"25592";
    
    self.contentArr = [NSMutableArray array];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        
    }
    
    for (int i = 0; i < 10; i++) {
        [self.contentArr addObject:[@(arc4random()%100) stringValue]];
    }

    VLNDrawAd *ad = [[VLNDrawAd alloc] initWithTagId:self.tagId];
    ad.delegate = self;
    [ad loadAdDataWithCount:3];
    self.ad = ad;
    
    [self.tableView registerClass:[DrawAdCell class] forCellReuseIdentifier:@"DrawAdCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell2"];
    
    self.testView.hidden = YES;
    
    

}

/**
 *  加载广告数据失败回调
 */
- (void)vl_drawAd:(VLNDrawAd *_Nullable)nativeAd didFailWithError:(NSError *_Nullable)error {
    NSLog(@"%@", error.localizedDescription);
}

- (void)vl_drawAd:(VLNDrawAd *)drawAd successToLoad:(NSArray<VLNDrawAdModel *> * _Nullable)drawAdModels {

    for (VLNDrawAdModel *info in drawAdModels) {
        [self.contentArr insertObject:info atIndex:arc4random()%10];
    }
    [self.tableView reloadData];
    
}

/**
    广告曝光回调
 */
- (void)vl_drawAdExposured:(VLNDrawAd *_Nullable)drawAd {
    
}

/**
    广告点击回调
 */
- (void)vl_drawAdDidClick:(VLNDrawAd *_Nullable)drawAd {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contentArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id info = [self.contentArr objectAtIndex:indexPath.row];
    if ([info isKindOfClass:[VLNDrawAdModel class]]) {
        DrawAdCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DrawAdCell"];
        cell.info = info;
        return cell;
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell2"];
        cell.textLabel.text = [@(indexPath.row) stringValue];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UIScreen.mainScreen.bounds.size.height;
}

#pragma mark scrollviewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self autoPlayVisibleVideo];
    
}

- (void)autoPlayVisibleVideo {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}
@end
