//
//  VLRootViewCell.m
//  DemoPolySDK
//
//  Created by yangting on 2020/8/13.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "VLRootViewCell.h"



@interface VLRootViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLb;

@end

@implementation VLRootViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}


- (void)setInfoDict:(NSDictionary *)infoDict {
    _infoDict = infoDict;
    
    self.titleLb.text = [infoDict objectForKey:kVLRootViewControllerAdNameKey];
}


@end
