//
//  VLRewardVideoAdController.m
//  DemoPolySDK
//
//  Created by yangting on 2020/8/13.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "VLRewardVideoAdController.h"
#import <VLionADSDK/VLNADSDK.h>

#import <MBProgressHUD/MBProgressHUD.h>

@interface VLRewardVideoAdController ()<VLNRewardedVideoAdDelegate>
@property (nonatomic, strong) VLNRewardedVideoAd *rewardVideoAd;
@property (weak, nonatomic) IBOutlet UIButton *showButton;
@end

@implementation VLRewardVideoAdController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.showButton setBackgroundColor:[UIColor grayColor]];
    self.showButton.enabled = NO;
    
    
    self.rewardVideoAd = [[VLNRewardedVideoAd alloc] initWithTagId:@"23974"];
    self.rewardVideoAd.delegate = self;
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.rewardVideoAd loadAd];
}

- (IBAction)btn_showAd:(id)sender {
    [self.rewardVideoAd showAdFromRootViewController:self];
}

#pragma mark --VLNRewardedVideoAdDelegate

- (void)vl_rewardVideoAdReadyToShow:(VLNRewardedVideoAd *)rewardedVideoAd {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    self.showButton.enabled = YES;
    self.showButton.backgroundColor = [UIColor blueColor];
    NSLog(@"激励视频可以展示");
}

- (void)vl_rewardVideoAdDidLoad:(VLNRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"数据加载成功");
}

- (void)vl_rewardVideoAdVideoDidLoad:(VLNRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"视频加载成功");
}

- (void)vl_rewardVideoAdWillVisible:(VLNRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"视频将要展示");
}

- (void)vl_rewardVideoAdDidExposed:(VLNRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"视频曝光");
}

- (void)vl_rewardVideoAdDidClose:(VLNRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"视频关闭");
    self.showButton.backgroundColor = [UIColor lightGrayColor];
    self.showButton.enabled = NO;
    [self.rewardVideoAd loadAd];
}

- (void)vl_rewardVideoAdDidClicked:(VLNRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"视频点击");
}


- (void)vl_rewardVideoAd:(VLNRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error {
    NSLog(@"出错");
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)vl_rewardVideoAdDidRewardEffective:(VLNRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"达到激励条件");
}

- (void)vl_rewardVideoAdDidPlayFinish:(VLNRewardedVideoAd *)rewardedVideoAd {
    NSLog(@"播放完成");
}

@end
