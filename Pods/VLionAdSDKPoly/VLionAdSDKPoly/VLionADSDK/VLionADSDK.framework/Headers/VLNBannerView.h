//
//  VLNBannerView.h
//  VLionADSDKDemo
//
//  Created by 1 on 2019/5/31.
//  Copyright © 2019 zhulin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol VLNBannerViewDelegate;

@interface VLNBannerView : UIView

/**
        横幅初始化构造方法--------聚合平台调用接口
        @param tagId 广告位id，必传；
        @param adSize 广告的长宽，必须要传一个确定的宽高
        @param delegate 回调事件代理，非必传
        @param rootViewController banner所处的控制器，处理点击相关事件使用，非必传
*/
- (instancetype)initWithTagId:(NSString *)tagId
                      adSize:(CGSize)adSize
                    delegate:(nullable id<VLNBannerViewDelegate>)delegate
          rootViewController:(nullable UIViewController *)rootViewController;

/**
         banner初始化成功了，可以在需要的时机去调用该方法
         加载广告
 */
- (void)loadAd;
/**
         广告位id
 */
@property (nonatomic, copy, readonly) NSString *tagId;

@end

@protocol VLNBannerViewDelegate <NSObject>

@optional
/**
         该方法只有在banner实际比例和初始化设置的偏差很大时候会执行
         @param sizeRate 广告实际宽高比
 */
- (void)vl_bannerView:(VLNBannerView *)bannerView sizeRate:(CGFloat)sizeRate;

/**
         Banner广告加载成功.
 */
- (void)vl_bannerViewDidLoad:(VLNBannerView *)bannerView;

/**
         Banner广告加载或者展示失败.
         @param error :失败error
 */
- (void)vl_bannerView:(VLNBannerView *)bannerView didFailWithError:(NSError *)error;

/**
         Banner广告曝光回调
 */
- (void)vl_bannerViewExposured:(VLNBannerView *)bannerView;

/**
         Banner广告点击回调
 */
- (void)vl_bannerViewDidClick:(VLNBannerView *)bannerView;

/**
         Banner广告关闭回调，您需要在该回调方法里面，移除掉广告对象
 */
- (void)vl_bannerViewDidClose:(VLNBannerView *)bannerView;

@end

NS_ASSUME_NONNULL_END
