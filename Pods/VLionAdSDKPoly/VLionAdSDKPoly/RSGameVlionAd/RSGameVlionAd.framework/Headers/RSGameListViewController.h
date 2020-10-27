//
//  RSGameListViewController.h
//  TestSDK
//
//  Created by yangting on 2020/5/28.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RSGameListViewControllerDelegate <NSObject>

@optional
/**
    进入游戏回调
 */
- (void)vlionAdViewClickGame:(NSString *_Nullable)gameId;

/**
    退出游戏回调
 */
- (void)vlionAdViewExitGame:(NSString *_Nullable)gameId;


/**
    banner展示成功
 */
- (void)vlionBannerAdExposedWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId;
/**
    banner展示失败
*/
- (void)vlionBannerAdLoadFailedWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId error:(NSError *_Nullable)error;
/**
    banner点击
 */
- (void)vlionBannerAdDidClickWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId;
/**
    banner点击关闭
*/
- (void)vlionBannerAdDidClosedWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId;


/**
    插屏展示成功
 */
- (void)vlionInterstitialAdExposedWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId;
/**
    插屏展示失败
*/
- (void)vlionInterstitialAdLoadFailedWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId error:(NSError *_Nullable)error;
/**
    插屏点击
 */
- (void)vlionInterstitialAdDidClickWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId;
/**
    插屏点击关闭
*/
- (void)vlionInterstitialAdDidClosedWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId;


/**
    激励视频展示成功
 */
- (void)vlionRewardVideoAdExposedWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId;
/**
    激励视频加载失败
*/
- (void)vlionRewardVideoAdLoadFailedWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId error:(NSError *_Nullable)error;
/**
    激励视频播放失败
*/
- (void)vlionRewardVideoAdPlayFailedWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId error:(NSError *_Nullable)error;
/**
    激励视频播放完成
*/
- (void)vlionRewardedVideoAdDidPlayFinishWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId error:(NSError *_Nullable)error;
/**
    激励视频点击
 */
- (void)vlionRewardVideoAdDidClickWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId;
/**
    激励视频点击关闭
*/
- (void)vlionRewardVideoAdDidClosedWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId;


/**
    开屏广告加载成功
*/
- (void)vlionSplashAdDidLoadWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId;
/**
    开屏广告曝光
*/
- (void)vlionSplashAdDidExposuredWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId;
/**
    开屏广告点击
*/
- (void)vlionSplashAdDidClickWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId;
/**
    开屏广告将要关闭
*/
- (void)vlionSplashAdWillCloseWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId;
/**
    开屏广告已经关闭
*/
- (void)vlionSplashAdDidCloseWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId;
/**
    开屏广告加载失败
*/
- (void)vlionSplashAdDidFailWithGameId:(NSString *_Nullable)gameId tagId:(NSString *_Nullable)tagId error:(NSError *_Nullable)error;

@end

NS_ASSUME_NONNULL_BEGIN

@interface RSGameListViewController : UIViewController
/**
 必传mediaId,可向客服获取
 */
- (instancetype)initWithMediaId:(NSString *)mediaId;

@property (nonatomic, weak) id<RSGameListViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
