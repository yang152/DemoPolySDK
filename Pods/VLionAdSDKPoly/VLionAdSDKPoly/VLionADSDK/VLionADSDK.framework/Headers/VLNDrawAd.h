//
//  VLNDrawAd.h
//  VLionADSDK
//
//  Created by yangting on 2020/6/4.
//  Copyright © 2020 zhulin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VLNDrawAdModel.h"

@class VLNDrawAd;
@protocol VLNDrawAdDelegate <NSObject>

@optional
/**
 *  原生广告加载广告数据成功回调，返回为VLionNativeAdModel对象
 */
- (void)vl_drawAd:(VLNDrawAd *_Nullable)drawAd successToLoad:(NSArray <VLNDrawAdModel *>*_Nullable)drawAdModels;

/**
 *  加载广告数据失败回调
 */
- (void)vl_drawAd:(VLNDrawAd *_Nullable)drawAd didFailWithError:(NSError *_Nullable)error;

/**
    广告曝光回调
 */
- (void)vl_drawAdExposured:(VLNDrawAd *_Nullable)drawAd;

/**
    广告点击回调
 */
- (void)vl_drawAdDidClick:(VLNDrawAd *_Nullable)drawAd;

@end

NS_ASSUME_NONNULL_BEGIN

@interface VLNDrawAd : NSObject
/**
 *  广告位 ID
 */
@property (nonatomic, copy, readonly) NSString * tagId;

- (instancetype)initWithTagId:(NSString *)tagId;
/**
  @param count 数量至少为1，建议1，最多3
 */
- (void)loadAdDataWithCount:(NSInteger)count;

@property (weak, nonatomic) id<VLNDrawAdDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
