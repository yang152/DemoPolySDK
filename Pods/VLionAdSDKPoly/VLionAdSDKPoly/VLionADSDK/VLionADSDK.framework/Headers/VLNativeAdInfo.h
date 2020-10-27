//
//  VLNativeAdInfo.h
//  VLionADSDK
//
//  Created by yangting on 2020/8/7.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VLNativeAdInfo : NSObject

@property (nonatomic, assign, readonly) CGSize adSize;

- (void)renderToView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
