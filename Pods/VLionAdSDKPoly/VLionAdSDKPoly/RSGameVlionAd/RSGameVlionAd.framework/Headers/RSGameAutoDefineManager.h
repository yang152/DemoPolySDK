//
//  RSGameAutoDefineManager.h
//  RSGameVlionAd
//
//  Created by yangting on 2020/8/6.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSGameListModel.h"
#import "RSGameListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSGameAutoDefineManager : NSObject

/**
    自定义游戏列表界面，请求数据接口
    @param mediaId  游戏id，找客服申请，聚合平台使用
    @param compeleteBlock 获取数据成功和失败回调，成功会返回一个数组
*/
+ (instancetype)managerWithMediaId:(NSString *)mediaId
                    compeleteBlock:(void(^)(NSArray <RSGameListModel *>*gameList, NSError *error))compeleteBlock;

/**
    自定义游戏列表界面，请求数据接口
    @param mediaId  游戏id，找客服申请，聚合平台使用
    @param delegate 游戏相关代理，不需要可以不用设置
    @param compeleteBlock 获取数据成功和失败回调，成功会返回一个数组
*/
+ (instancetype)managerWithMediaId:(NSString *)mediaId
                          delegate:(nullable id<RSGameListViewControllerDelegate>)delegate
                    compeleteBlock:(void(^)(NSArray <RSGameListModel *>*gameList, NSError *error))compeleteBlock;

/**
     自定义界面跳转游戏页面
 */
+ (void)pushGamePageWithModel:(RSGameItemInfo *)model
         navigationController:(UINavigationController *)navigationController;

/**
     游戏列表页面加载完成打点，需要用户自己去调用
 */
+ (void)statisticGameListPageLoadSuccess;

@end

NS_ASSUME_NONNULL_END
