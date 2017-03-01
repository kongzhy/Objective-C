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
    
    NSString *identifier = [[JDPNetManager sharedManager] sendAsynchronousRequest:bizHTTPRequest success:^(JDPNetHTTPRequest *request, JDPNetHTTPResponse *response) {
        [self successAnalyseWithRequest:bizHTTPRequest Response:response success:successBlock failure:failureBlock];
    } failure:^(JDPNetHTTPRequest *request, JDPNetHTTPResponse *response, NSError *error) {
        failureBlock(bizHTTPRequest, nil, error);
    }];
    return identifier;
}

+ (void)successAnalyseWithRequest:(JDPNetBizHTTPRequest *)bizHTTPRequest
                         Response:(JDPNetHTTPResponse *)response
                          success:(JDPNetBizSuccessBlock)successBlock
                          failure:(JDPNetBizFailureBlock)failureBlock {
    
    JDPNetBizHTTPResponse *bizHTTPResponse = [[JDPNetBizHTTPResponse alloc] init];
    
    NSError *error = nil;
    // 分析响应
    if (response.URLResponse) {
        bizHTTPResponse.URLResponse = response.URLResponse;
    } else {
        error = [[NSError alloc] initWithDomain:JDPNetBizErrorDomain code:JDPNetBizResponseErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetBizResponseErrorDescription}];
        failureBlock(bizHTTPRequest, bizHTTPResponse, error);
        return;
    }
    
    // 分析返回数据
    if (response.dataObject) {
        bizHTTPResponse.dataObject = response.dataObject;
    } else {
        error = [[NSError alloc] initWithDomain:JDPNetBizErrorDomain code:JDPNetBizDataErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetBizDataErrorDescription}];
        failureBlock(bizHTTPRequest, bizHTTPResponse, error);
        return;
    }
    
    // 数据赋值
    if ([response.dataObject isKindOfClass:[NSDictionary class]]) {
        [bizHTTPResponse setValuesForKeysWithDictionary:(NSDictionary *)(response.dataObject)];
    } else {
        error = [[NSError alloc] initWithDomain:JDPNetBizErrorDomain code:JDPNetBizDataTypeErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetBizDataTypeErrorDescription}];
        failureBlock(bizHTTPRequest, bizHTTPResponse, error);
        return;
    }
    
    // 分析resultCode
    if (bizHTTPResponse.resultCode && ![bizHTTPResponse.resultCode isEqualToString:@""]) {
        BOOL isSuccess = [self analyseResultCode:bizHTTPResponse.resultCode successCodes:bizHTTPRequest.successCodes];
        if (isSuccess) {
            successBlock(bizHTTPRequest, bizHTTPResponse);
            return;
        } else {
            error = [[NSError alloc] initWithDomain:JDPNetBizErrorDomain code:JDPNetBizBusinessErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetBizBusinessErrorDescription}];
            failureBlock(bizHTTPRequest, bizHTTPResponse, nil);
            return;
        }
    } else {
        error = [[NSError alloc] initWithDomain:JDPNetBizErrorDomain code:JDPNetBizDataCodeErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetBizDataCodeErrorDescription}];
        failureBlock(bizHTTPRequest, bizHTTPResponse, error);
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
