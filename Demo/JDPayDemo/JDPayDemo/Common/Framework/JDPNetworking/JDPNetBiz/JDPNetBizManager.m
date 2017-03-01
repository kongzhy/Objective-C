//
//  JDPNetBizManager.m
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/27.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import "JDPNetBizManager.h"
#import "JDPNetManager.h"

@implementation JDPNetBizManager

+ (NSString *)sendAsynchronousRequest:(JDPNetBizHTTPRequest *)bizHTTPRequest
                              success:(JDPNetBizSuccessBlock)successBlock
                              failure:(JDPNetBizFailureBlock)failureBlock {
    
    NSString *identifier = [[JDPNetManager sharedManager] sendAsynchronousRequest:bizHTTPRequest success:^(JDPNetHTTPRequest *request) {
        [self successAnalyseWithBizRequest:bizHTTPRequest request:request success:successBlock failure:failureBlock];
    } failure:^(JDPNetHTTPRequest *request, NSError *error) {
        failureBlock(bizHTTPRequest, error);
    }];
    return identifier;
}

+ (void)successAnalyseWithBizRequest:(JDPNetBizHTTPRequest *)bizHTTPRequest
                             request:(JDPNetHTTPRequest *)request
                             success:(JDPNetBizSuccessBlock)successBlock
                             failure:(JDPNetBizFailureBlock)failureBlock {
    NSError *error = nil;
    // 分析响应
    if (request.URLResponse) {
        bizHTTPRequest.URLResponse = request.URLResponse;
    } else {
        error = [[NSError alloc] initWithDomain:JDPNetBizErrorDomain code:JDPNetBizResponseErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetBizResponseErrorDescription}];
        failureBlock(bizHTTPRequest, error);
        return;
    }
    
    // 分析返回数据
    if (request.dataObject) {
        bizHTTPRequest.dataObject = request.dataObject;
    } else {
        error = [[NSError alloc] initWithDomain:JDPNetBizErrorDomain code:JDPNetBizDataErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetBizDataErrorDescription}];
        failureBlock(bizHTTPRequest, error);
        return;
    }
    
    // 数据赋值
    if (![request.dataObject isKindOfClass:[NSDictionary class]]) {
        error = [[NSError alloc] initWithDomain:JDPNetBizErrorDomain code:JDPNetBizDataTypeErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetBizDataTypeErrorDescription}];
        failureBlock(bizHTTPRequest, error);
        return;
    }
    
    // resultCode
    bizHTTPRequest.resultCode = ((NSDictionary *)request.dataObject)[@"resultCode"];
    // resultMsg
    bizHTTPRequest.resultMsg = ((NSDictionary *)request.dataObject)[@"resultMsg"];
    // resultData
    bizHTTPRequest.resultData = ((NSDictionary *)request.dataObject)[@"resultData"];
    // resultCtrl
    bizHTTPRequest.resultCtrl = ((NSDictionary *)request.dataObject)[@"resultCtrl"];
    // 分析resultCode
    if (bizHTTPRequest.resultCode && ![bizHTTPRequest.resultCode isEqualToString:@""]) {
        BOOL isSuccess = [self analyseResultCode:bizHTTPRequest.resultCode successCodes:bizHTTPRequest.successCodes];
        if (isSuccess) {
            successBlock(bizHTTPRequest);
            return;
        } else {
            error = [[NSError alloc] initWithDomain:JDPNetBizErrorDomain code:JDPNetBizBusinessErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetBizBusinessErrorDescription}];
            failureBlock(bizHTTPRequest, nil);
            return;
        }
    } else {
        error = [[NSError alloc] initWithDomain:JDPNetBizErrorDomain code:JDPNetBizDataCodeErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetBizDataCodeErrorDescription}];
        failureBlock(bizHTTPRequest, error);
        return;
    }
}

+ (BOOL)analyseResultCode:(NSString *)code successCodes:(NSArray *)successCodes {
    __block BOOL isSuccess = NO;
    // 如果没有设置，默认0为成功
    if (!successCodes || successCodes.count) {
        successCodes = @[@0];
    }
    
    [successCodes enumerateObjectsUsingBlock:^(NSNumber *successCode, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([code integerValue] == [successCode integerValue]) {
            isSuccess = YES;
            *stop = YES;
        }
    }];
    return isSuccess;
}

@end
