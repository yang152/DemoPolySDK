//
//  NativeNewsNormalModel.m
//  VlionAdSDK_3000
//
//  Created by yangting on 2020/6/30.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "NativeNewsNormalModel.h"

@implementation NativeNewsNormalModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.type = [dict valueForKey:@"type"];
        self.title = [dict valueForKey:@"title"];
        self.source = [dict valueForKey:@"source"];
        self.incon = [dict valueForKey:@"incon"];
        self.imgs = [dict valueForKey:@"imgs"];
        
        if ([self.type isEqualToString: @"title"]) {
            self.cellHeight = 100;
        }else if ([self.type isEqualToString: @"titleImg"]){
            self.cellHeight = 130;
        }else if ([self.type isEqualToString: @"bigImg"]){
            self.cellHeight = 100+[UIScreen mainScreen].bounds.size.width*0.6;
        }else if ([self.type isEqualToString: @"threeImgs"]){
            self.cellHeight = 196;
        }else{
            self.cellHeight = 0;
        }
        
    }
    return self;
}
@end
