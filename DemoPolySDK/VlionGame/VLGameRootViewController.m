//
//  VLGameRootViewController.m
//  DemoPolySDK
//
//  Created by yangting on 2020/9/3.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "VLGameRootViewController.h"
#import "VLRootViewCell.h"
#import "VLGameAutoDefineController.h"

#import <RSGameVlionAd/RSGameVlionAd.h>

@interface VLGameRootViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *contentArr;

@end

@implementation VLGameRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self defaultInit];
        
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark --初始化配置
- (void)defaultInit {
    [self.tableView registerNib:[UINib nibWithNibName:@"VLRootViewCell" bundle:nil] forCellReuseIdentifier:@"VLRootViewCell"];
    
    self.title = @"小游戏SDK";
}

- (void)loadData {
    self.contentArr = @[
    @{kVLRootViewControllerAdTypeKey : @(RSGameLoadTypeDefault),
      kVLRootViewControllerAdNameKey : @"直接加载SDK小游戏"},
    
    @{kVLRootViewControllerAdTypeKey : @(RSGameLoadTypeAutoDefine),
      kVLRootViewControllerAdNameKey : @"用户自定义游戏列表"}
    ];
}

- (void)handleEventWithAdType:(RSGameLoadType)sdkAdType {
    switch (sdkAdType) {
        case RSGameLoadTypeDefault:
            {
                RSGameListViewController *vc = [[RSGameListViewController alloc] initWithMediaId:@"150"];
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
            
        case RSGameLoadTypeAutoDefine:
        {
            VLGameAutoDefineController *vc = [VLGameAutoDefineController new];
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
    RSGameLoadType sdkAdType = [[infoDict objectForKey:kVLRootViewControllerAdTypeKey] integerValue];
    [self handleEventWithAdType:sdkAdType];
}

@end
