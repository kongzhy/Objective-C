//
//  JDPHTTPRequest.m
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/24.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import "JDPNetHTTPRequest.h"

@interface JDPNetHTTPRequest ()

@end

@implementation JDPNetHTTPRequest

#pragma mark - LifeCycle

/// 初始化，配置默认参数
- (instancetype)init {
    self = [super init];
    if (self) {
        _serverURL = @"";
        _HTTPMethod = @"POST";
        _timeoutInterval = 20;
    }
    return self;
}

@end
