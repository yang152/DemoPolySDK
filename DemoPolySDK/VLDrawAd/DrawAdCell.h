//
//  DrawAdCell.h
//  AppDemo
//
//  Created by yangting on 2020/6/5.
//  Copyright © 2020 zhulin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <VLionADSDK/VLNDrawAd.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawAdCell : UITableViewCell
@property (nonatomic, strong) VLNDrawAdModel *info;
@end

NS_ASSUME_NONNULL_END
