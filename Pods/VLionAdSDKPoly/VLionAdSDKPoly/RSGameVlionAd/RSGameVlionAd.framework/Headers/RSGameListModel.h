//
//  RSGameListModel.h
//  RSGameVlionAd
//
//  Created by yangting on 2020/8/6.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSGameItemInfo : NSObject

@property (nonatomic, copy) NSString *c_end;
@property (nonatomic, copy) NSString *c_start;
@property (nonatomic, copy) NSString *clk_num;
@property (nonatomic, copy) NSString *gameId;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *orientation;

@end

@interface RSGameListModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSArray <RSGameItemInfo *>*itemArr;

@end

NS_ASSUME_NONNULL_END
