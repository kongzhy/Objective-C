//
//  JDPHTTPSession.m
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/24.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import "JDPNetHTTPSession.h"
#import "Reachability.h"
#import "JDPNetParse.h"
#import "JDPNetHTTPResponse.h"

@interface JDPNetHTTPSession ()

@property (nonatomic, strong) JDPNetHTTPRequest *request;

@end

@implementation JDPNetHTTPSession

#pragma mark - LifeCycle

- (instancetype)initWithRequest:(JDPNetHTTPRequest *)request {
    self = [super init];
    if (self) {
        _request = request;
        _identifier = [[NSUUID UUID] UUIDString];
    }
    return self;
}

#pragma mark - Override

- (void)main {
    /// 判断是否已经取消
    if (self.isCancelled) {
        return;
    }
    
    NSError *error = nil;
    
    /// 检查网络状况
    if (![self checkNetWork]) {
        error = [[NSError alloc] initWithDomain:JDPNetErrorDomain code:JDPNetNetworkErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetNetworkErrorDescription}];
        // 保证回调在主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            self.failureBlock(_request, nil, error);
        });
        return;
    }
    
    /// 检查地址和服务
    if (![self checkURLWithRequest:_request]) {
        error = [[NSError alloc] initWithDomain:JDPNetErrorDomain code:JDPNetURLErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetURLErrorDescription}];
        // 保证回调在主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            self.failureBlock(_request, nil, error);
        });
        return;
    }
    
    /// 请求方法
    
    if ([_request.HTTPMethod isEqualToString:@"POST"]) {
        [self sendPostRequest:_request];
    } else {
        
    }
}

#pragma mark - Private

- (BOOL)checkNetWork {
    return [[Reachability reachabilityWithHostName:@"msjdpay.jd.com"] isReachable];
}

- (BOOL)checkURLWithRequest:(JDPNetHTTPRequest *)request {
    if (!request.serverURL || [request.serverURL isEqualToString:@""] || !request.functionID || [request.functionID isEqualToString:@""]) {
        return NO;
    }
    return YES;
}

- (void)sendPostRequest:(JDPNetHTTPRequest *)request {
    /// 判断是否已经取消
    if (self.isCancelled) {
        return;
    }
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@", request.serverURL, request.functionID];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *URLRequest = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:request.timeoutInterval];
    
    [URLRequest setHTTPMethod:request.HTTPMethod];
    [URLRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSData *bodyData = [JDPNetParse dataWithJSONObject:request.paramDict];
    [URLRequest setHTTPBody:bodyData];
    
    JDPNetHTTPResponse *HTTPResponse = [[JDPNetHTTPResponse alloc] init];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *URLsession = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *task = [URLsession dataTaskWithRequest:URLRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        /// 判断是否已经取消
        if (self.isCancelled) {
            return;
        }
        
        // 接收响应
        HTTPResponse.URLResponse = response;
        
        /// 请求失败
        if (error) {
            // 保证回调在主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                self.failureBlock(_request, HTTPResponse, error);
            });
            return;
        }
        
        // 解析数据
        NSObject *object = [JDPNetParse JSONObjectWithData:data];
        
        // 接收数据
        HTTPResponse.dataObject = object;
        
        /// 根据数据分析业务成功和失败
        dispatch_async(dispatch_get_main_queue(), ^{
            self.successBlock(request, HTTPResponse);
        });
    }];
    [task resume];
}

@end