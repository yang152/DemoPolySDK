//
//  KSAdSplashManager.h
//  KSAdSDK
//
//  Created by zhangchuntao on 2020/6/2.
//

#import <Foundation/Foundation.h>
#import "KSAdSplashInteractDelegate.h"
#import "KSAdSplashViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSAdSplashManager : NSObject

/// 需要在didFinishLaunching中设置posId
@property (nonatomic, copy, class) NSString *posId;
/// 闪屏交互代理
@property (nonatomic, weak, class) id<KSAdSplashInteractDelegate> interactDelegate;
/// 是否有本地缓存广告
@property (nonatomic, assign, readonly, class) BOOL hasCachedSplash DEPRECATED_MSG_ATTRIBUTE("Deprecated, will always return YES");

/**
 * @brief 获取闪屏信息并缓存
 */
+ (void)loadSplash;
/**
 * @brief   校验本地缓存广告
 * @param   callback    校验回调，如果有可展示广告会返回splashViewController，否则为空
 */
+ (void)checkSplash:(void (^)(KSAdSplashViewController * _Nullable splashViewController))callback;
/**
 * @brief   校验本地缓存广告
 * @param   timeoutInterval 超时时间，单位s，建议不少于3，否则影响展示率
 * @param   callback        校验回调，如果有可展示广告会返回splashViewController，否则为空
 */
+ (void)checkSplashWithTimeout:(NSTimeInterval)timeoutInterval completion:(void (^)(KSAdSplashViewController * _Nullable splashViewController))callback;

@end

NS_ASSUME_NONNULL_END
