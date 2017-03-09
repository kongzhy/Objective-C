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

#pragma mark - Public

+ (NSString *)sendAsynchronousRequest:(JDPNetBizHTTPRequest *)bizHTTPRequest
                              success:(JDPNetBizSuccessBlock)successBlock
                              failure:(JDPNetBizFailureBlock)failureBlock {
    
    NSString *identifier = [[JDPNetManager sharedManager] sendAsynchronousRequest:bizHTTPRequest success:^(JDPNetHTTPRequest *request) {
        [self private_successAnalyseWithBizRequest:bizHTTPRequest success:successBlock failure:failureBlock];
    } failure:^(JDPNetHTTPRequest *request, NSError *error) {
        failureBlock(bizHTTPRequest, error);
    }];
    return identifier;
}

- (void)cancelRequestWithIdentifier:(NSString *)identifier {
    [[JDPNetManager sharedManager] cancelRequestWithIdentifier:identifier];
}

#pragma mark - Private

/**
 请求成功后对返回数据的分析，判断是否业务失败

 @param bizHTTPRequest 业务请求模型（包含返回参数）
 @param successBlock 成功回执
 @param failureBlock 失败回执
 */
+ (void)private_successAnalyseWithBizRequest:(JDPNetBizHTTPRequest *)bizHTTPRequest
                                     success:(JDPNetBizSuccessBlock)successBlock
                                     failure:(JDPNetBizFailureBlock)failureBlock {
    NSError *error = nil;
    // 分析响应
    if (!bizHTTPRequest.URLResponse) {
        error = [[NSError alloc] initWithDomain:JDPNetBizErrorDomain code:JDPNetBizResponseErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetBizResponseErrorDescription}];
        failureBlock(bizHTTPRequest, error);
        return;
    }
    
    // 分析返回数据
    if (!bizHTTPRequest.dataObject) {
        error = [[NSError alloc] initWithDomain:JDPNetBizErrorDomain code:JDPNetBizDataErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetBizDataErrorDescription}];
        failureBlock(bizHTTPRequest, error);
        return;
    }
    
    // 数据赋值
    if (![bizHTTPRequest.dataObject isKindOfClass:[NSDictionary class]]) {
        error = [[NSError alloc] initWithDomain:JDPNetBizErrorDomain code:JDPNetBizDataTypeErrorCode userInfo:@{NSLocalizedDescriptionKey : JDPNetBizDataTypeErrorDescription}];
        failureBlock(bizHTTPRequest, error);
        return;
    }
    
    // resultCode
    bizHTTPRequest.resultCode = [[NSString alloc] initWithFormat:@"%@", ((NSDictionary *)bizHTTPRequest.dataObject)[@"resultCode"]];
    // resultMsg
    bizHTTPRequest.resultMsg = ((NSDictionary *)bizHTTPRequest.dataObject)[@"resultMsg"];
    // resultData
    bizHTTPRequest.resultData = ((NSDictionary *)bizHTTPRequest.dataObject)[@"resultData"];
    // resultCtrl
    bizHTTPRequest.resultCtrl = ((NSDictionary *)bizHTTPRequest.dataObject)[@"resultCtrl"];
    // 分析resultCode
    if (bizHTTPRequest.resultCode && ![bizHTTPRequest.resultCode isEqualToString:@""]) {
        BOOL isSuccess = [self private_analyseResultCode:bizHTTPRequest.resultCode successCodes:bizHTTPRequest.successCodes];
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


/**
 根据请求入参分析resultCode，判断成功失败

 @param code
 @param successCodes
 @return 请求成功或者失败
 */
+ (BOOL)private_analyseResultCode:(NSString *)resultCode successCodes:(NSArray *)successCodes {
    __block BOOL isSuccess = NO;
    // 如果没有设置，默认0为成功
    if (!successCodes || successCodes.count) {
        successCodes = @[@0];
    }
    
    [successCodes enumerateObjectsUsingBlock:^(NSNumber *successCode, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([resultCode integerValue] == [successCode integerValue]) {
            isSuccess = YES;
            *stop = YES;
        }
    }];
    return isSuccess;
}

@end
