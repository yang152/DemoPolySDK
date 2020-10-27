//
//  VLNDrawAdModel.h
//  VLionADSDK
//
//  Created by yangting on 2020/6/4.
//  Copyright © 2020 zhulin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VLNDrawAdModel : NSObject

/**
 *  广告加载完成后，设置一个view去展示广告
 */
- (void)renderToView:(UIView *)toView rootViewController:(UIViewController *)rootViewController;

/**
 *  移除广告
 */
- (void)unregisterView;

@end

NS_ASSUME_NONNULL_END
