//
//  JDPNetDefine.h
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/27.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>

// Error Domain
extern NSString * const JDPNetErrorDomain;

// Error Code
typedef NS_ENUM(NSUInteger, JDPNetErrorCode) {
    JDPNetNetworkErrorCode = 1000,
    JDPNetURLErrorCode     = 1001,
};

// Error Description
extern NSString * const JDPNetNetworkErrorDescription;
extern NSString * const JDPNetURLErrorDescription;

// Block
@class JDPNetHTTPRequest;
@class JDPNetHTTPResponse;

typedef void (^JDPNetSuccessBlock) (JDPNetHTTPRequest *request, JDPNetHTTPResponse *response);
typedef void (^JDPNetFailureBlock) (JDPNetHTTPRequest *request, JDPNetHTTPResponse *response, NSError * error);

@interface JDPNetDefine : NSObject

@end
