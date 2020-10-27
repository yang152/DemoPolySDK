//
//  VLNInterstitialAd.h
//  VLionADSDKDemo
//
//  Created by 1 on 2019/6/3.
//  Copyright © 2019 zhulin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol VLNInterstitialAdDelegate;

@interface VLNInterstitialAd : NSObject

/**
 *  构造方法
 @param tagId - 广告位 ID
 */
- (instancetype)initWithTagId:(NSString *)tagId;

@property (nonatomic, weak) id<VLNInterstitialAdDelegate> delegate;

/**
 *  广告位 ID
 */
@property (nonatomic, copy, readonly) NSString *tagId;

/**
 *  插屏广告预加载是否完成
 */
@property (nonatomic, assign, readonly) BOOL isReady;

/**
 *  广告发起请求
 */
- (void)loadAdData;

/**
*      广告展示在viewController中
*      提示: Splash广告只支持竖屏
*     @param viewController 展示插屏广告容器容器
*/
- (void)presentFromRootViewController:(UIViewController *)viewController;

@end

@protocol VLNInterstitialAdDelegate <NSObject>

@optional
/**
 插屏广告成功展示.
 */
- (void)vl_interstitialAdDidLoad:(VLNInterstitialAd *)interstitialAd;

/**
 插屏广告展示失败.
 @param error :失败error
 */
- (void)vl_interstitialAd:(VLNInterstitialAd *)interstitialAd didFailWithError:(NSError *)error;

/**
 插屏广告曝光回调
 */
- (void)vl_interstitialAdExposured:(VLNInterstitialAd *)interstitialAd;

/**
 插屏广告点击回调
 */
- (void)vl_interstitialAdDidClick:(VLNInterstitialAd *)interstitialAd;

/**
 插屏广告关闭回调
 */
- (void)vl_interstitialAdDidClose:(VLNInterstitialAd *)interstitialAd;

/**
 插屏广告将要关闭回调
 */
- (void)vl_interstitialAdWillClose:(VLNInterstitialAd *)interstitialAd;

@end

NS_ASSUME_NONNULL_END
