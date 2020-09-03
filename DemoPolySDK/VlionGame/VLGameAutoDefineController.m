//
//  VLGameAutoDefineController.m
//  DemoPolySDK
//
//  Created by yangting on 2020/9/3.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "VLGameAutoDefineController.h"
#import <RSGameVlionAd/RSGameAutoDefineManager.h>
#import <SDWebImage.h>
#import <MBProgressHUD.h>

@interface VLGameAutoDefineController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) NSArray *array;

@end

@implementation VLGameAutoDefineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [RSGameAutoDefineManager managerWithMediaId:@"45" compeleteBlock:^(NSArray * _Nonnull gameList, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if (!error) {
            self.array = gameList;
            [self.tableView reloadData];
            [RSGameAutoDefineManager statisticGameListPageLoadSuccess];
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    RSGameListModel *m = [self.array objectAtIndex:section];
    return m.itemArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    RSGameListModel *m = [self.array objectAtIndex:indexPath.section];
    RSGameItemInfo *info = [m.itemArr objectAtIndex:indexPath.row];
    cell.textLabel.text = info.name;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:info.icon]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RSGameListModel *m = [self.array objectAtIndex:indexPath.section];
    RSGameItemInfo *info = [m.itemArr objectAtIndex:indexPath.row];
    [RSGameAutoDefineManager pushGamePageWithModel:info navigationController:self.navigationController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.navigationBarHidden = NO;
}

@end
