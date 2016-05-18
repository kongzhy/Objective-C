//
//  RootViewController.m
//  NSURLConnectionTest
//
//  Created by Conway on 16/4/8.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#import "RootViewController.h"
#import "JDPRequestManager.h"

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
    [self startRequest];
}


- (void)startRequest {
    JDPHTTPRequest *request = [[JDPHTTPRequest alloc] init];
    request.serverURL = @"https://payfront.jd.com/service/preparePay";
    request.paramDict = @{
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
    NSString *firstRequestIdentifier = [JDPRequestManager sendAsynchronousRequest:request success:^(JDPHTTPRequest *request, id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(JDPHTTPRequest *request, NSError *error) {
        NSLog(@"%@", error);
    }];
    NSLog(@"%@", firstRequestIdentifier);
    
    JDPHTTPRequest *secondRequest = [[JDPHTTPRequest alloc] init];
    secondRequest.serverURL = @"https://payfront.jd.com/service/Pay";
    secondRequest.paramDict = @{
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
    NSString *secondRequestIdentifier = [JDPRequestManager sendAsynchronousRequest:secondRequest success:^(JDPHTTPRequest *request, id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(JDPHTTPRequest *request, NSError *error) {
        NSLog(@"%@", error);
    }];
    NSLog(@"%@", secondRequestIdentifier);
}

@end
