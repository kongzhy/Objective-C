//
//  JDPNetBizDefine.h
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/28.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>

// Error Domain
extern NSString * const JDPNetBizErrorDomain;

// Error Code
typedef NS_ENUM(NSUInteger, JDPNetBizErrorCode) {
    JDPNetBizResponseErrorCode = 2000,
    JDPNetBizDataErrorCode     = 2001,
    JDPNetBizDataTypeErrorCode = 2002,
    JDPNetBizDataCodeErrorCode = 2003,
    JDPNetBizBusinessErrorCode = 2004,
};

// Error Description
extern NSString * const JDPNetBizResponseErrorDescription;
extern NSString * const JDPNetBizDataErrorDescription;
extern NSString * const JDPNetBizDataTypeErrorDescription;
extern NSString * const JDPNetBizDataCodeErrorDescription;
extern NSString * const JDPNetBizBusinessErrorDescription;

// Block
@class JDPNetBizHTTPRequest;
@class JDPNetBizHTTPResponse;

typedef void (^JDPNetBizSuccessBlock) (JDPNetBizHTTPRequest *bizHTTPRequest, JDPNetBizHTTPResponse *bizHTTPResponse);
typedef void (^JDPNetBizFailureBlock) (JDPNetBizHTTPRequest *bizHTTPRequest, JDPNetBizHTTPResponse *bizHTTPResponse, NSError * error);
