//
//  VLNContent.h
//  VLionADSDK
//
//  Created by yangting on 2020/8/5.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VLNContent : NSObject

/**

    构造方法 聚合平台使用
    @param tagId 内容id
    @param compeleteBlock 回调，初始化成功会返回一个控制器，用来展示内容

*/
- (instancetype)initWithTagId:(NSString *)tagId
                   compeleteBlock:(void(^)(UIViewController *viewController, NSError *error))compeleteBlock;


@property (nonatomic, strong, readonly) UIViewController *viewController;


/**

    内容id

*/
@property (nonatomic, copy, readonly) NSString *tagId;

@end



NS_ASSUME_NONNULL_END
