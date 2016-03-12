//
//  UIWebView+JDPCategory.m
//  JDPayDemo
//
//  Created by Conway on 16/3/7.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#import "UIWebView+JDPCategory.h"

@implementation UIWebView (JDPCategory)

+ (void)jdp_setupWebViewUserAgent {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSString *oldAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    NSString *newAgent = [oldAgent stringByAppendingString:@"\tJDPay UserAgent"];
    NSDictionary *dictionnary = [[NSDictionary alloc] initWithObjectsAndKeys:newAgent, @"UserAgent", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionnary];
}
@end
