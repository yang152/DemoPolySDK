//
//  VlionAdPageView.h
//  RSMixVoildSDK
//
//  Created by 周晓旭 on 2020/2/16.
//  Copyright © 2020 周晓旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VLNewsAdInfoModel, VlionAdPageView;

@protocol VlionAdPageViewAdDataSource <NSObject>
/**
 
     该回调为用户加载自己广告而设置，返回YES则使用用户自己的广告；返回NO则使用SDK内部广告
 
     @param pageView         新闻对象
 
     @param adInfoModel  广告相关信息
 
     @param titleIndex    新闻标题栏下标
 
 */
- (BOOL)vlionAdPageView:(VlionAdPageView *_Nullable)pageView didLoadAdInfo:(VLNewsAdInfoModel *_Nullable)adInfoModel titleIndex:(NSInteger)titleIndex;

@optional
/**
     标题栏下标为titleIndex的页面，将要刷新页面，重新获取数据
 */
- (void)vlionAdPageView:(VlionAdPageView *_Nullable)pageView beginRefreshNewDataWithTitleIndex:(NSInteger)titleIndex;
/**
    标题栏下标为titleIndex的页面，已经获取到数据，但是并没有刷新页面
*/
- (void)vlionAdPageView:(VlionAdPageView *_Nullable)pageView endRefreshBeforeHandleNewDataWithTitleIndex:(NSInteger)titleIndex;
/**
    标题栏下标为titleIndex的页面，已经获取到数据，已经刷新了页面
*/
- (void)vlionAdPageView:(VlionAdPageView *_Nullable)pageView endRefreshAfterHandleNewDataWithTitleIndex:(NSInteger)titleIndex;

@end

NS_ASSUME_NONNULL_BEGIN

@interface VlionAdPageView : UIView

/**
    使用聚合平台，新闻页面初始化方法，所有参数为必传参数
 
    @param frame                  新闻对象的位置，初始化要传递准确frame，不建议使用约束
 
    @param media                  找客服申请
 
    @param submedia           找客服申请
 
    @param currentVC         新闻页面展示的控制器
*/
- (instancetype)initWithFrame:(CGRect)frame
                        media:(NSString *)media
                     submedia:(NSString *)submedia
                    currentVC:(UIViewController *)currentVC;

/**
     @param pageHomeLoadStatus 首页加载完成回调，success为YES，标识加载成功；NO表示加载失败；
 */
- (instancetype)initWithFrame:(CGRect)frame
                        media:(NSString *)media
                     submedia:(NSString *)submedia
                    currentVC:(UIViewController *)currentVC
           pageHomeLoadStatus:( void(^ _Nullable )(BOOL success))pageHomeLoadStatus;
/**
     新闻首页加载成功和失败回调
 */
@property (nonatomic, copy) void(^pageHomeLoadStatus)(BOOL success);
/**
     整个新闻页面停留时间，从新闻首页页面渲染成功到首页对象析构
 */
@property (nonatomic, copy) void(^pageTimeLengthBlock)(NSTimeInterval pageTimeLength);

/**
     VlionAdPageView是否可以返回，新闻列表也可能是用web模式，需要用到这个属性和下面方法；
 */
@property (nonatomic, readonly) BOOL canGoBack;

- (void)goBack;


/**
    如果要自定义广告，可以设置这个代理
 */
@property (nonatomic, weak) id<VlionAdPageViewAdDataSource>adSource;

/**
   刷新页面
*/
- (void)updateView;
/**
   刷新页面
*/
- (void)updateViewWithAdInfoModel:(VLNewsAdInfoModel *)adInfoModel;
/**
   关闭广告
*/
- (void)deleteAdInfoModel:(VLNewsAdInfoModel *)adInfoModel;

/**
   广告点击打点
*/
- (void)onAdClickWithAdModel:(VLNewsAdInfoModel *)adModel;

/**
   广告曝光打点
*/
- (void)onAdExposeWithAdModel:(VLNewsAdInfoModel *)adModel;

@end

NS_ASSUME_NONNULL_END
