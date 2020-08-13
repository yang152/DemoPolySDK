//
//  VLRootViewCell.h
//  DemoPolySDK
//
//  Created by yangting on 2020/8/13.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VLPolyAdSDKType) {
    VLPolyAdSDKTypeSplash = 1,    /// 开屏广告
    VLPolyAdSDKTypeBanner,        /// banner广告
    VLPolyAdSDKTypeInterstitial,  /// 插屏广告
    VLPolyAdSDKTypeRewardVideo,   /// 激励视频广告
    VLPolyAdSDKTypeNative,        /// 原生广告
    VLPolyAdSDKTypeDraw,          /// draw广告
    VLPolyAdSDKTypeContent,       /// 内容加draw广告混合
    VLPolyAdSDKTypeSmallGame,     /// 瑞狮小游戏
    VLPolyAdSDKTypeNewsPage       /// 瑞狮新闻资讯
};

#define kVLRootViewControllerAdTypeKey @"kVLRootViewControllerAdTypeKey"
#define kVLRootViewControllerAdNameKey @"kVLRootViewControllerAdNameKey"

NS_ASSUME_NONNULL_BEGIN

@interface VLRootViewCell : UITableViewCell

@property (nonatomic, strong) NSDictionary *infoDict;

@end

NS_ASSUME_NONNULL_END
