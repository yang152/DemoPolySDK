//
//  ViewController.m
//  DemoPolySDK
//
//  Created by yangting on 2020/8/12.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "VLRootViewController.h"
#import "VLRootViewCell.h"

#import "VLSplashRootController.h"

@interface VLRootViewController ()
<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *contentArr;
@end

@implementation VLRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self defaultInit];
    
    [self loadData];
}

#pragma mark --初始化配置
- (void)defaultInit {
    [self.tableView registerNib:[UINib nibWithNibName:@"VLRootViewCell" bundle:nil] forCellReuseIdentifier:@"VLRootViewCell"];
    
    self.title = @"瑞狮融合SDK";
}

- (void)loadData {
    self.contentArr = @[
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeSplash),
      kVLRootViewControllerAdNameKey : @"开屏广告"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeBanner),
      kVLRootViewControllerAdNameKey : @"横幅广告"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeInterstitial),
      kVLRootViewControllerAdNameKey : @"插屏广告"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeRewardVideo),
      kVLRootViewControllerAdNameKey : @"激励视频广告"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeNative),
      kVLRootViewControllerAdNameKey : @"原生广告"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeDraw),
      kVLRootViewControllerAdNameKey : @"Draw广告"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeContent),
      kVLRootViewControllerAdNameKey : @"内容和Draw广告混合"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeSmallGame),
      kVLRootViewControllerAdNameKey : @"小游戏"},
    
    @{kVLRootViewControllerAdTypeKey : @(VLPolyAdSDKTypeNewsPage),
      kVLRootViewControllerAdNameKey : @"新闻资讯"},
    ];
}

- (void)handleEventWithAdType:(VLPolyAdSDKType)sdkAdType {
    switch (sdkAdType) {
        case VLPolyAdSDKTypeSplash:
            {
                VLSplashRootController *vc = [VLSplashRootController new];
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
            
        default:
            break;
    }
}

#pragma mark --UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.contentArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VLRootViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VLRootViewCell"];
    cell.infoDict = [self.contentArr objectAtIndex:indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *infoDict = [self.contentArr objectAtIndex:indexPath.section];
    VLPolyAdSDKType sdkAdType = [[infoDict objectForKey:kVLRootViewControllerAdTypeKey] integerValue];
    [self handleEventWithAdType:sdkAdType];
}

@end
