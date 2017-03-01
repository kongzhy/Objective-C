//
//  JDPHTTPSession.h
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/24.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDPNetHTTPRequest.h"
#import "JDPNetDefine.h"

@interface JDPNetHTTPSession : NSOperation

/**
 *  唯一标识符
 */
@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, copy) JDPNetSuccessBlock successBlock;
@property (nonatomic, copy) JDPNetFailureBlock failureBlock;

- (instancetype)initWithRequest:(JDPNetHTTPRequest *)request;

@end
