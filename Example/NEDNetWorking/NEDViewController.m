//
//  NEDViewController.m
//  NEDNetWorking
//
//  Created by Joker on 12/14/2021.
//  Copyright (c) 2021 Joker. All rights reserved.
//

#import "NEDViewController.h"
#import "NEDNetworkHeader.h"
#import "NEDEncryptTool.h"
#import "NEDActivityIndicator.h"

static NSString * const kParamsKeyStr = @"content";
static NSString * const kBaseUrl = @"192.33.324.45/base";
static NSInteger const kSuccessCode = 200;// 后端定义成功的错误码
static CGFloat const kTimeOut = 15.0f;

@interface NEDViewController ()

@property (nonatomic, strong) NEDActivityIndicator *activityIndicatorView;

@end

@implementation NEDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *params = @{@"name":@"数据"};
    
    self.activityIndicatorView = [[NEDActivityIndicator alloc] initWithFrame:CGRectMake(0, 0,56, 56)];
    [self.activityIndicatorView hidesWhenStopped];
    self.activityIndicatorView.center = self.view.center;
    self.activityIndicatorView.firstColor = [UIColor colorWithRed:232.0/255.0f green:35.0/255.0f blue:111.0/255.0f alpha:1.0];
    self.activityIndicatorView.secondColor = [UIColor colorWithRed:111.0/255.0f green:35.0/255.0f blue:232.0/255.0f alpha:1.0];
    self.activityIndicatorView.thirdColor = [UIColor colorWithRed:232.0/255.0f green:111.0/255.0f blue:35.0/255.0f alpha:1.0];
    [self.view addSubview:self.activityIndicatorView];
    [self.activityIndicatorView startAnimating];
    
    // 配置网络相关
    [[NEDNetworking shareNetWorking] setNetworkConfig:^(__kindof NEDNetworkConfig * _Nonnull config) {
        config.successCode = kSuccessCode;
        config.timeoutInterval = kTimeOut;
        config.baseUrl = kBaseUrl;
        config.isShowLoadingHUD = YES;
        config.encryptParamsClass = NSStringFromClass(NEDEncryptTool.class);
        config.encryptParamsMethod = [NEDEncryptTool encryptMethodStiring];
        config.encryptParamsKeyStr = kParamsKeyStr;
        config.headerDict = @{}.mutableCopy;
    }];
    
    // 开始网络请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.activityIndicatorView stopAnimating];
    });
    
    [[NEDNetworking shareNetWorking] requestUrl:@"api/ddss/wed" httpMethod:NEDRequestMethodGET params:params.mutableCopy compelete:^(NEDNetworkBaseModel * _Nonnull model) {
        
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)refreshUI {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
