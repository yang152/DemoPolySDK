//
//  NativeHelper.h
//  VlionAdSDK_3000
//
//  Created by yangting on 2020/6/30.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NativeHelper : NSObject
+ (NSAttributedString *)titleAttributeText:(NSString *)text;
+ (NSAttributedString *)subtitleAttributeText:(NSString *)text;
+ (NSAttributedString *)infoAttributeText:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
