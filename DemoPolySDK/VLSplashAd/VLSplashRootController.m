//
//  VLSplashRootController.m
//  DemoPolySDK
//
//  Created by yangting on 2020/8/13.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "VLSplashRootController.h"
#import <VLionADSDK/VLNADSDK.h>

@interface VLSplashRootController ()<VLNSplashAdDelegate>

@property (nonatomic, strong) VLNSplashAd *splashAd;

@end

@implementation VLSplashRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"开屏广告";
}

#pragma mark --开屏类型事件
- (IBAction)btn_loadAndShowSplash:(id)sender {
    
}

- (IBAction)btn_loadSplash:(UIButton *)sender {
    VLNSplashAd *splashAd = [[VLNSplashAd alloc] initWithTagId:@"23799"];
    splashAd.delegate = self;
    [self.splashAd loadAd];
    self.splashAd = splashAd;
}

- (IBAction)btn_autoDefinSplash:(UIButton *)sender {
    [self.splashAd showAdInWindow:self.view.window];
}

#pragma mark --VLNSplashAdDelegate
- (void)vl_splashAdDidLoad:(VLNSplashAd *)splashAd {
    NSLog(@"VLNSplashAd didLoad");
}

- (void)vl_splashAd:(VLNSplashAd *)splashAd didFailWithError:(NSError *)error {
    NSLog(@"-------VLNSplashAd didFailWithError----%@", error.localizedDescription);
}

/**
 开屏广告曝光回调
 */
- (void)vl_splashAdExposured:(VLNSplashAd *)splashAd {
    NSLog(@"开屏广告曝光");
}

/**
 开屏广告点击回调
 */
- (void)vl_splashAdDidClick:(VLNSplashAd *)splashAd {
    NSLog(@"开屏广告被点击");
}

/**
 开屏广告关闭回调
 */
- (void)vl_splashAdDidClose:(VLNSplashAd *)splashAd {
    NSLog(@"开屏广告已经关闭");
    self.splashAd = nil;
}

/**
  开屏广告将要关闭回调
 */
- (void)vl_splashAdWillClose:(VLNSplashAd *)splashAd {
    NSLog(@"开屏广告将要关闭");
}

@end
