//
//  DrawAdCell.m
//  AppDemo
//
//  Created by yangting on 2020/6/5.
//  Copyright © 2020 zhulin. All rights reserved.
//

#import "DrawAdCell.h"

@interface DrawAdCell ()
@property (nonatomic, strong) UIView *videoView;

@end

@implementation DrawAdCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.videoView = [UIView new];
        [self.contentView addSubview:self.videoView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.videoView.frame = self.bounds;
}

- (void)setInfo:(VLNDrawAdModel *)info {
    if (_info != info) {
//        [_info unregisterView];
        _info = info;
        [info renderToView:self.videoView rootViewController:(UIViewController *)self.superview.superview.nextResponder];
    }
}

@end
