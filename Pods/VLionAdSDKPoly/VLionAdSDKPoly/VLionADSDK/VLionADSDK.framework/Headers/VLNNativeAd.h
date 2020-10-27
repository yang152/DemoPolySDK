//
//  VLNNativeAd.h
//  VLionADSDKDemo
//
//  Created by 1 on 2019/6/5.
//  Copyright © 2019 zhulin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "VLNativeAdInfo.h"

NS_ASSUME_NONNULL_BEGIN

@protocol VLNNativeAdDelegate;

@interface VLNNativeAd : NSObject

/**
     构造方法
     @param tagId 广告位id
     @param adSize 广告宽高----高度为0，会自适应高度
     @param delegate 代理
     @param viewController 用来处理广告跳转之类的一些事件
 */
- (instancetype)initWithTagId:(NSString *)tagId
                       adSize:(CGSize)adSize
                     delegate:(id<VLNNativeAdDelegate>)delegate
               viewController:(nullable UIViewController *)viewController;
/**
 *  广告位 ID
 */
@property (nonatomic, copy, readonly) NSString *tagId;

// 加载广告
- (void)loadAd;

/**
*  广告的size------支持kvo
*/
@property (nonatomic, assign, readonly) CGSize adSize;

@end

@protocol VLNNativeAdDelegate <NSObject>
@optional;
/**
     原生广告加载成功
 */
- (void)vl_nativeAdDidLoadSuccess:(VLNNativeAd *)nativeAd nativeAdModels:(NSArray <VLNativeAdInfo *>*)nativeAdModels;

/**
 *  原生广告加载广告数据失败回调
 */
- (void)vl_nativeAd:(VLNNativeAd *)nativeAd didFailWithError:(NSError *)error;

/**
 广告曝光回调
 */
- (void)vl_nativeAdExposured:(VLNNativeAd *)nativeAd;

/**
 广告点击回调
 */
- (void)vl_nativeAdDidClick:(VLNNativeAd *)nativeAd;

/**
 广告点击关闭
 */
- (void)vl_nativeAdDidClickClose:(VLNNativeAd *)nativeAd;



@end

NS_ASSUME_NONNULL_END
