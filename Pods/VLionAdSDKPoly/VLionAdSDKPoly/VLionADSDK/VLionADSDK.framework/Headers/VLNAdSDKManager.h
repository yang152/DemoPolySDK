//
//  BUAdSDKManager.h
//  VLionADSDKDemo
//
//  Created by 1 on 2019/5/28.
//  Copyright © 2019 zhulin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VLNAdSDKManager : NSObject

+ (VLNAdSDKManager * _Nonnull)defaultManager;

/**
 根据AppId初始化广告SDK
 @param appID : 瑞狮平台注册的AppId,不填将导致无法请求广告数据
 瑞狮平台地址:http://puma.vlion.cn
 */
- (void)setAppID:(NSString *)appID;


- (NSString *)appID;

- (NSString *)getSDKVersion;

@end

NS_ASSUME_NONNULL_END
