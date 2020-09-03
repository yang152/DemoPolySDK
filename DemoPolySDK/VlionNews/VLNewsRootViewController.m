//
//  VLNewsRootViewController.m
//  DemoPolySDK
//
//  Created by yangting on 2020/9/3.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "VLNewsRootViewController.h"
#import "VLRootViewCell.h"

#import "NewsViewController.h"
#import "NewsOutAdViewController.h"
#import "NewsOutAdViewController2.h"

@interface VLNewsRootViewController ()
@property (nonatomic, strong) NSArray *contentArr;

@end

@implementation VLNewsRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self defaultInit];
        
    [self loadData];
}

#pragma mark - Table view data source
#pragma mark --初始化配置
- (void)defaultInit {
    [self.tableView registerNib:[UINib nibWithNibName:@"VLRootViewCell" bundle:nil] forCellReuseIdentifier:@"VLRootViewCell"];
    
    self.title = @"新闻SDK";
}

- (void)loadData {
    self.contentArr = @[
    @{kVLRootViewControllerAdTypeKey : @(RSNewsLoadTypeDefault),
      kVLRootViewControllerAdNameKey : @"直接加载新闻"},
    
    @{kVLRootViewControllerAdTypeKey : @(RSNewsLoadTypeUsVlAd),
      kVLRootViewControllerAdNameKey : @"使用瑞狮广告自定义新闻"},
    
    @{kVLRootViewControllerAdTypeKey : @(RSNewsLoadTypeUsThirdAd),
      kVLRootViewControllerAdNameKey : @"使用其它广告自定义新闻"}
    
    ];
}

- (void)handleEventWithAdType:(RSNewsLoadType)sdkAdType {
    switch (sdkAdType) {
        case RSNewsLoadTypeDefault:
            {
                NewsViewController *vc = [NewsViewController new];
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
            
        case RSNewsLoadTypeUsVlAd:
        {
            NewsOutAdViewController *vc = [NewsOutAdViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case RSNewsLoadTypeUsThirdAd:
        {
            NewsOutAdViewController2 *vc = [NewsOutAdViewController2 new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
                        
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
    RSNewsLoadType sdkAdType = [[infoDict objectForKey:kVLRootViewControllerAdTypeKey] integerValue];
    [self handleEventWithAdType:sdkAdType];
}


@end
