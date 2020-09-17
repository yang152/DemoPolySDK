//
//  NewsOutAdViewController2.m
//  VlionAdSDK_3000
//
//  Created by yangting on 2020/7/9.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "NewsOutAdViewController2.h"
#import <VLionNewsSDK/VLionNewsSDK.h>
#import <BUAdSDK/BUAdSDK.h>

@interface NewsOutAdViewController2 ()<UIGestureRecognizerDelegate, VlionAdPageViewAdDataSource, BUNativeExpressAdViewDelegate>
@property (nonatomic, strong) NSMutableDictionary <NSString *, BUNativeExpressAdManager *>*adManagers;
@property (nonatomic, strong) NSMutableDictionary <NSString *, VLNewsAdInfoModel *>*pageMs;

@property (nonatomic, strong) VlionAdPageView *pageView;

@property (nonatomic, strong) NSLock *lock;

@end

@implementation NewsOutAdViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [BUAdSDKManager setAppID:@"5050702"];
    self.lock  = [[NSLock alloc] init];
    
    self.adManagers = [NSMutableDictionary dictionary];
    self.pageMs = [NSMutableDictionary dictionary];
    
    VlionAdPageView *view = [[VlionAdPageView alloc] initWithFrame:self.view.bounds media:@"730" submedia:@"1009" currentVC:self];
    view.adSource = self;
    [self.view addSubview:view];
    self.pageView = view;

    self.title = @"自己在外部调用其它平台的广告";
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.pageView.frame = self.view.bounds;
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    
//    self.navigationController.interactivePopGestureRecognizer.delegate = self;
//    self.navigationController.navigationBarHidden = NO;
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    self.navigationController.navigationBarHidden = YES;
//}
#pragma mark --VlionAdPageViewDelegate
- (BOOL)vlionAdPageView:(VlionAdPageView *_Nullable)pageView didLoadAdInfo:(VLNewsAdInfoModel *_Nullable)adInfoModel titleIndex:(NSInteger)titleIndex {
    
//    BOOL allowUserDefine = arc4random()%100%2;
//    if (allowUserDefine) {
        [self.pageMs setObject:adInfoModel forKey:adInfoModel.adUniqueId];

        BUAdSlot *slot1 = [[BUAdSlot alloc] init];
        slot1.ID = @"945054977";
        slot1.AdType = BUAdSlotAdTypeFeed;
        BUSize *imgSize = [BUSize sizeBy:BUProposalSize_Feed690_388];
        slot1.imgSize = imgSize;
        slot1.position = BUAdSlotPositionFeed;
        slot1.isSupportDeepLink = YES;
        BUNativeExpressAdManager *nativeExpressAdManager = [[BUNativeExpressAdManager alloc] initWithSlot:slot1 adSize:CGSizeMake(self.pageView.bounds.size.width, 0)];
        nativeExpressAdManager.delegate = self;
        [nativeExpressAdManager loadAd:1];
        [self.adManagers setValue:nativeExpressAdManager forKey:adInfoModel.adUniqueId];
        
//    }
//    return allowUserDefine;
    return YES;

}
#pragma mark --BUNativeExpressAdViewDelegate
- (void)nativeExpressAdSuccessToLoad:(BUNativeExpressAdManager *)nativeExpressAd views:(NSArray<__kindof BUNativeExpressAdView *> *)views{
    
    [self.adManagers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, BUNativeExpressAdManager * _Nonnull obj, BOOL * _Nonnull stop) {
        if (obj == nativeExpressAd) {
            
            VLNewsAdInfoModel *info = [self.pageMs objectForKey:key];
            
            BUNativeExpressAdView *v = views.firstObject;
            v.rootViewController = self;
            v.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 0);
            info.adView = v;
            info.adHeight = 0;
            [v render];
            *stop = YES;
        }
    }];
    [self.pageView updateView];
    
}

- (void)nativeExpressAdViewRenderSuccess:(BUNativeExpressAdView *)nativeExpressAdView {
    [self.pageMs enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, VLNewsAdInfoModel * _Nonnull obj, BOOL * _Nonnull stop) {
        if (obj.adView == nativeExpressAdView) {
            obj.adHeight = nativeExpressAdView.bounds.size.height;
            *stop = YES;
        }
    }];
    [self.pageView updateView];
}

- (void)nativeExpressAdFailToLoad:(BUNativeExpressAdManager *)nativeAd didFailWithError:(NSError *)error {
}
- (void)nativeExpressAdViewRenderFail:(BUNativeExpressAdView *)nativeExpressAdView error:(NSError *)error {
}


- (void)nativeExpressAdView:(BUNativeExpressAdView *)nativeExpressAdView dislikeWithReason:(NSArray<BUDislikeWords *> *)filterWords {
   [self.lock lock];
   [self.pageMs enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, VLNewsAdInfoModel * _Nonnull obj, BOOL * _Nonnull stop) {
       if (obj.adView == nativeExpressAdView) {
           [self.pageView deleteAdInfoModel:obj];
           *stop = YES;
       }
   }];
    [self.lock unlock];
}

/// 点击打点上报
- (void)nativeExpressAdViewDidClick:(BUNativeExpressAdView *)nativeExpressAdView {
    [self.pageMs enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, VLNewsAdInfoModel * _Nonnull obj, BOOL * _Nonnull stop) {
        if (obj.adView == nativeExpressAdView) {
            [self.pageView onAdClickWithAdModel:obj];
            *stop = YES;
        }
    }];
}

/**
     标题栏下标为titleIndex的页面，将要刷新页面，重新获取数据
 */
- (void)vlionAdPageView:(VlionAdPageView *_Nullable)pageView beginRefreshNewDataWithTitleIndex:(NSInteger)titleIndex {
    NSLog(@"%d页面开始重新获取数据", titleIndex);
}
/**
    标题栏下标为titleIndex的页面，已经获取到数据，但是并没有刷新页面
*/
- (void)vlionAdPageView:(VlionAdPageView *_Nullable)pageView endRefreshBeforeHandleNewDataWithTitleIndex:(NSInteger)titleIndex {
    NSLog(@"%d页面已经获取到了数据", titleIndex);
}
/**
    标题栏下标为titleIndex的页面，已经获取到数据，已经刷新了页面
*/
- (void)vlionAdPageView:(VlionAdPageView *_Nullable)pageView endRefreshAfterHandleNewDataWithTitleIndex:(NSInteger)titleIndex {
    NSLog(@"%d页面已经刷新了页面", titleIndex);
}

@end
