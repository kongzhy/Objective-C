//
//  RootViewController.m
//  NSURLConnectionTest
//
//  Created by Conway on 16/4/8.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#import "RootViewController.h"
#import "JDPLogMacros.h"
#import "JDPNetBizManager.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"NSURLConnection";
    self.view.backgroundColor = [UIColor whiteColor];
    [self createRequestButton];
}

- (void)createRequestButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.bounds = CGRectMake(0, 0, 200.f, 40.f);
    button.center = self.view.center;
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"Request" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(startRequest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    JDP_Log(@"Cownay");
    //[self startRequest];
}


- (void)startRequest {
    JDPNetBizHTTPRequest *bizHTTPRequest = [[JDPNetBizHTTPRequest alloc] init];
    bizHTTPRequest.serverURL = @"https://payfront.jd.com";
    bizHTTPRequest.functionID = @"service/preparePay";
    NSDictionary *paramDict = @{
                                @"app_id" : @"com.wangyin.sdk",
                                @"payParam" : @"4da0365626e73cb98d43d70fd8324de7dfa3496b34192ba5c7a499ee2d5adb43bac03fca0414af661dda89d30fe97653dbe70e50690cd8ab19c22300200781665f13fd2b5f4c297409ac81bf8167ad6b906a0facc83bd4a253a32e4359848e97b66933beea4d6d3bc6c637160b1a144d",
                                @"idfa" : @"D75A62EC-CCF4-4F88-A32B-F584681B15B9",
                                @"clientVersion" : @"1.0",
                                @"osVersion" : @"9.3",
                                @"openUDID" : @"1942d8f68e3e9ea09631dac42f162c2152b3e4fc",
                                @"deviceType" : @"x86_64",
                                @"appId" : @"mallapp",
                                @"networkType" : @"WIFI",
                                @"resolution" : @"750*1334",
                                @"sdkVersion" : @"1.1.0",
                                @"osPlatform" : @"iPhone OS"
                                };
    bizHTTPRequest.paramDict = paramDict;
    
    [JDPNetBizManager sendAsynchronousRequest:bizHTTPRequest success:^(JDPNetBizHTTPRequest *bizHTTPRequest) {
        NSLog(@"%@", bizHTTPRequest.dataObject);
    } failure:^(JDPNetBizHTTPRequest *bizHTTPRequest, NSError *error) {
        NSLog(@"%@", error);
    }];
}

@end
