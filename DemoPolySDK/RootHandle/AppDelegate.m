//
//  AppDelegate.m
//  DemoPolySDK
//
//  Created by yangting on 2020/8/12.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "AppDelegate.h"
#import <VLionADSDK/VLNADSDK.h>

@interface AppDelegate ()<VLNSplashAdDelegate>
@property (nonatomic, strong) VLNSplashAd *splashAd;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[VLNAdSDKManager defaultManager] setAppID:@"30164"];
    
    VLNSplashAd *splashAd = [[VLNSplashAd alloc] initWithTagId:@"23799"];
    splashAd.delegate = self;
    [self.splashAd loadAd];
    self.splashAd = splashAd;
    
    return YES;
}


#pragma mark --VLNSplashAdDelegate
- (void)vl_splashAdDidLoad:(VLNSplashAd *)splashAd {
    NSLog(@"VLNSplashAd didLoad");
    [self.splashAd showAdInWindow:self.window];
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
