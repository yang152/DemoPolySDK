//
//  SplashViewController.m
//  VlionAdSDK_3000
//
//  Created by yangting on 2020/7/17.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "SplashViewController.h"
#import <VLionADSDK/VLNAdSDK.h>

@interface SplashViewController ()<VLNSplashAdDelegate>
@property (nonatomic, strong) IBOutlet UIImageView *bottomView;

@property (nonatomic, strong) VLNSplashAd *splashAd;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int scheduledTime;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;
@property (weak, nonatomic) IBOutlet UIView *skipView;
@end

@implementation SplashViewController

- (void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"%@-------dealloc", self.class);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.bottomView.backgroundColor = [UIColor redColor];
    
    self.bottomView.frame = CGRectMake(0, UIScreen.mainScreen.bounds.size.height - UIScreen.mainScreen.bounds.size.width/3, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.width/3);
    self.skipView.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width - 100, 44, 100, 30);
    self.timeLb.frame = self.skipView.bounds;
    
    self.scheduledTime = 25;
    self.timeLb.text = [NSString stringWithFormat:@"%ds", self.scheduledTime];
    
    __weak SplashViewController *wVC = self;
    if (@available(iOS 10.0, *)) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [wVC timerClock:timer];
        }];
    } else {
        // Fallback on earlier versions
        self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerClock:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:(NSRunLoopCommonModes)];
    }
    
    self.splashAd = [[VLNSplashAd alloc] initWithTagId:@"23799"];
    self.splashAd.delegate = self;
    [self.splashAd loadAd];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapA:)];
    [self.skipView addGestureRecognizer:tap];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)timerClock:(NSTimer *)timer {
    self.scheduledTime--;
    
    if (self.scheduledTime <= 0) {
        [self.navigationController popViewControllerAnimated:NO];
    }
    else {
        self.timeLb.text = [NSString stringWithFormat:@"%ds", self.scheduledTime];
    }
}

- (void)tapA:(UITapGestureRecognizer *)tap {
    NSLog(@"触发点击自定义跳过");
    
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)showWithSplashAd:(VLNSplashAd *)splashAd {
//    [splashAd showWithViewController:self bottomView:self.bottomView skipView:self.skipView];
}


#pragma mark --VLNSplashAdDelegate

/**
 开屏广告成功展示.
 */
- (void)vl_splashAdDidLoad:(VLNSplashAd *)splashAd {
//    [self.splashAd showWithViewController:self bottomView:self.bottomView skipView:self.skipView exposureDuration:self.scheduledTime];
}

/**
 开屏广告展示失败.
 @param error :失败error
 */
- (void)vl_splashAd:(VLNSplashAd *)splashAd didFailWithError:(NSError *)error {
    NSLog(@"%@", error);
}

/**
 开屏广告曝光回调
 */
- (void)vl_splashAdExposured:(VLNSplashAd *)splashAd {
    
}

/**
 开屏广告点击回调
 */
- (void)vl_splashAdDidClick:(VLNSplashAd *)splashAd {
    
}

/**
 开屏广告关闭回调
 */
- (void)vl_splashAdDidClose:(VLNSplashAd *)splashAd {
    [self.navigationController popViewControllerAnimated:NO];
}

/**
  开屏广告将要关闭回调
 */
- (void)vl_splashAdWillClose:(VLNSplashAd *)splashAd {
    
}

@end
