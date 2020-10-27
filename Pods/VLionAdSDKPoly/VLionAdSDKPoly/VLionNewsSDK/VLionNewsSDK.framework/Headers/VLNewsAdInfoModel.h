//
//  VLNewsAdInfoModel.h
//  VLionNewsSDK
//
//  Created by yangting on 2020/7/8.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VLNewsAdInfoModel : NSObject
/**
     广告位id
 */
@property (nonatomic, copy, readonly) NSString *tagid;
/**
     广告唯一编号
 */
@property (nonatomic, copy, readonly) NSString *adUniqueId;
/**
     广告在列表中的位置
 */
@property (nonatomic, assign, readonly) NSInteger adCellIndex;

@property (nonatomic, strong) UIView *adView;
@property (nonatomic, assign) CGFloat adHeight;

- (instancetype)initWithTagId:(NSString *)tagId cellIndex:(NSInteger)cellIndex;

@end

NS_ASSUME_NONNULL_END
