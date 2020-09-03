//
//  NewsViewController.m
//  VlionAdSDK_3000
//
//  Created by yangting on 2020/6/29.
//  Copyright © 2020 杨挺. All rights reserved.
//

#import "NewsViewController.h"
#import <VLionNewsSDK/VLionNewsSDK.h>
#import "Toast.h"

@interface NewsViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) VlionAdPageView *pageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *navH;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = CGRectMake(0, 88, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height - 88);
    if (UIScreen.mainScreen.bounds.size.height < 740) {
        frame = CGRectMake(0, 64, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height - 64);
        self.navH.constant = 64;
    }
    VlionAdPageView *view = [[VlionAdPageView alloc] initWithFrame:frame
                                                             media:@"730"
                                                          submedia:@"1009"
                                                         currentVC:self];
//    VlionAdPageView *view = [[VlionAdPageView alloc] initWithFrame:frame
//                                                             media:@"730"
//                                                          submedia:@"1009"
//                                                         currentVC:self
//                                                pageHomeLoadStatus:^(BOOL success) {
//        NSLog(@"--------------新闻加载%@", success ? @"成功" : @"失败");
//    }];
//    __weak NewsViewController *wSelf = self;
//    view.pageTimeLengthBlock = ^(NSTimeInterval pageTimeLength) {
//        NSLog(@"----------%.4f", pageTimeLength);
//        [[UIApplication sharedApplication].keyWindow makeToast:[NSString stringWithFormat:@"新闻页面加载成功到返回耗时%.4fs", pageTimeLength]];
//    };
    [self.view addSubview:view];
    self.pageView = view;
    
    self.title = @"新闻SDK内部自己加载广告";
    
    self.view.backgroundColor = [UIColor whiteColor];

}

- (IBAction)btn_back:(id)sender {
//    if (self.pageView.canGoBack) {
//        [self.pageView goBack];
//    }
//    else {
        [self.navigationController popViewControllerAnimated:YES];
//    }
}

//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    
//    CGRect frame = CGRectMake(0, 88, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height - 88);
//    self.pageView.frame = self.view.bounds;
//}

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

@end
