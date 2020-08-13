//
//  NativeNewsNormalCell.h
//  VlionAdSDK_3000
//
//  Created by yangting on 2020/6/30.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NativeNewsNormalModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NativeNewsNormalCell : UITableViewCell
@property (nonatomic, strong) NativeNewsNormalModel *model;
@property (nonatomic, strong, nullable) UIView *separatorLine;
@property (nonatomic, strong, nullable) UILabel *titleLabel;
@property (nonatomic, strong, nullable) UILabel *inconLable;
@property (nonatomic, strong, nullable) UILabel *sourceLable;
@property (nonatomic, strong, nullable) UIImageView *closeIncon;
- (void)refreshUIWithModel:(NativeNewsNormalModel *_Nonnull)model;
@end

@interface BUDFeedNormalTitleTableViewCell : NativeNewsNormalCell

@end

@interface BUDFeedNormalTitleImgTableViewCell : NativeNewsNormalCell
@property (nonatomic, strong, nullable) UIImageView *img;
@end

@interface BUDFeedNormalBigImgTableViewCell : NativeNewsNormalCell
@property (nonatomic, strong, nullable) UIImageView *bigImg;
@end

@interface BUDFeedNormalthreeImgsableViewCell : NativeNewsNormalCell
@property (nonatomic, strong, nullable) UIImageView *img1;
@property (nonatomic, strong, nullable) UIImageView *img2;
@property (nonatomic, strong, nullable) UIImageView *img3;
@end

NS_ASSUME_NONNULL_END
