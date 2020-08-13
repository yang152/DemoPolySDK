//
//  VLNativeRootViewController.m
//  DemoPolySDK
//
//  Created by yangting on 2020/8/13.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "VLNativeRootViewController.h"
#import <VLionADSDK/VLNADSDK.h>
#import "NativeDemoTableViewListVC.h"
#import "VLNativeViewController.h"

@interface VLNativeRootViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation VLNativeRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = @[
        
        @{
            @"title": @"信息流tableview模式demo",
            @"tagId": @"23798",
        },
        
        @{
            @"title": @"直接加载原生广告",
            @"tagId": @"23798",
        }
    ];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *adCell = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:adCell];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:adCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row][@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 1) {
        VLNativeViewController *demoVc = [[VLNativeViewController alloc] init];
        [self.navigationController pushViewController:demoVc animated:YES];
    }
    else if (indexPath.row == 0) {
        NativeDemoTableViewListVC *vc = [NativeDemoTableViewListVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
