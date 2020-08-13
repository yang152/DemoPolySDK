//
//  VLInterstitialAdController.m
//  DemoPolySDK
//
//  Created by yangting on 2020/8/13.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "VLInterstitialAdController.h"
#import <VLionADSDK/VLNADSDK.h>

#import <MBProgressHUD/MBProgressHUD.h>

@interface VLInterstitialAdController ()<VLNInterstitialAdDelegate>

@property (nonatomic, strong) VLNInterstitialAd *interstitialAd;

@property (weak, nonatomic) IBOutlet UIButton *showButton;

@end

@implementation VLInterstitialAdController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.showButton.enabled = NO;
    self.showButton.backgroundColor = [UIColor grayColor];
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.interstitialAd = [[VLNInterstitialAd alloc] initWithTagId:@"23800"];
    self.interstitialAd.delegate = self;
    [self.interstitialAd loadAdData];
}


- (IBAction)btn_showAd:(id)sender {
    if (self.interstitialAd.isReady) {
        [self.interstitialAd presentFromRootViewController:self];
    }
    else {
        NSLog(@"黑没有准备好");
    }
}

#pragma mark --VLNInterstitialAdDelegate
/**
 插屏广告成功展示.
 */
- (void)vl_interstitialAdDidLoad:(VLNInterstitialAd *)interstitialAd {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    self.showButton.enabled = YES;
    self.showButton.backgroundColor = [UIColor blueColor];
}

/**
 插屏广告展示失败.
 @param error :失败error
 */
- (void)vl_interstitialAd:(VLNInterstitialAd *)interstitialAd didFailWithError:(NSError *)error {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSLog(@"广告加载失败----%@", error);
}

/**
 插屏广告曝光回调
 */
- (void)vl_interstitialAdExposured:(VLNInterstitialAd *)interstitialAd {
    
}

/**
 插屏广告点击回调
 */
- (void)vl_interstitialAdDidClick:(VLNInterstitialAd *)interstitialAd {
    
}

/**
 插屏广告关闭回调
 */
- (void)vl_interstitialAdDidClose:(VLNInterstitialAd *)interstitialAd {
    
}

/**
 插屏广告将要关闭回调
 */
- (void)vl_interstitialAdWillClose:(VLNInterstitialAd *)interstitialAd {
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.showButton.enabled = NO;
    self.showButton.backgroundColor = [UIColor grayColor];
    [self.interstitialAd loadAdData];
}
@end
