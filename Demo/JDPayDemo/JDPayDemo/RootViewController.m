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
#import "UIButton+JDPCategory.h"
#import <objc/message.h>

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
    UIButton *button = [UIButton jdp_buttonWithTitle:@"Request" type:UIButtonTypeSystem handler:^{
        [self startTest];
    }];
    button.bounds = CGRectMake(0, 0, 200.f, 40.f);
    button.center = self.view.center;
    button.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:button];
}

- (void)startTest {
//    Class class = NSClassFromString(@"JDPPayInfo");
//    id object = [[class alloc] init];
//    // objc_msgSend(class, @selector(dynamicClassMethod));
//    objc_msgSend(object, @selector(pay));
    
    // message swizzling
    Method method1 = class_getInstanceMethod([NSString class], @selector(lowercaseString));
    Method method2 = class_getInstanceMethod([NSString class], @selector(uppercaseString));
    method_exchangeImplementations(method1, method2);
    NSString *string = @"Hello World!";
    NSLog(@"%@", [string lowercaseString]);
}


- (void)startRequest {
    JDPNetBizHTTPRequest *bizHTTPRequest = [[JDPNetBizHTTPRequest alloc] init];
    bizHTTPRequest.serverURL = @"http://payfrontyf.jd.com";
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
