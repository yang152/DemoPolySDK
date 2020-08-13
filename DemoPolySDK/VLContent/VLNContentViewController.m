//
//  VLNContentViewController.m
//  VlionAdSDK_3000
//
//  Created by yangting on 2020/8/6.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "VLNContentViewController.h"
#import <VLionADSDK/VLNADSDK.h>

@interface VLNContentViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) VLNContent *vlContent;
@end

@implementation VLNContentViewController

- (void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak VLNContentViewController *wSelf = self;
    self.vlContent = [[VLNContent alloc] initWithTagId:@"25983" compeleteBlock:^(UIViewController * _Nonnull viewController, NSError * _Nonnull error) {
        if (!error) {
            [wSelf addChildViewController:wSelf.vlContent.viewController];
            [wSelf.view addSubview:wSelf.vlContent.viewController.view];
            wSelf.vlContent.viewController.view.frame = UIScreen.mainScreen.bounds;
        }
    }];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}


@end
