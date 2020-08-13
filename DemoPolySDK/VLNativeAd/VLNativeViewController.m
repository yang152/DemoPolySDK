//
//  VLNativeViewController.m
//  DemoPolySDK
//
//  Created by yangting on 2020/8/13.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "VLNativeViewController.h"
#import <VLionADSDK/VLNADSDK.h>

@interface VLNativeViewController ()<VLNNativeAdDelegate>
@property (weak, nonatomic) IBOutlet UIView *nativeRenderView;
@property (nonatomic, strong) VLNNativeAd  *nativeAd;

@end

@implementation VLNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.nativeRenderView.frame = CGRectMake(50, 100, 300, 200);
    self.nativeRenderView.backgroundColor = [UIColor blueColor];
    
    self.nativeAd = [[VLNNativeAd alloc] initWithTagId:@"23798"
                                                adSize:self.nativeRenderView.bounds.size
                                              delegate:self
                                        viewController:self];
    [self.nativeAd loadAd];
    
}

/**
     原生广告加载成功
 */
- (void)vl_nativeAdDidLoadSuccess:(VLNNativeAd *)nativeAd nativeAdModels:(NSArray <VLNativeAdInfo *>*)nativeAdModels {
    [nativeAdModels.firstObject renderToView:self.nativeRenderView];
}

/**
 *  原生广告加载广告数据失败回调
 */
- (void)vl_nativeAd:(VLNNativeAd *)nativeAd didFailWithError:(NSError *)error {
    NSLog(@"nativeAd fail %@", error.userInfo[@"NSLocalizedFailureReason"]);
}

/**
 广告曝光回调
 */
- (void)vl_nativeAdExposured:(VLNNativeAd *)nativeAd {
    // 修正父视图frame
    self.nativeRenderView.frame = CGRectMake(self.nativeRenderView.frame.origin.x, self.nativeRenderView.frame.origin.y, nativeAd.adSize.width, nativeAd.adSize.height);
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

@end
