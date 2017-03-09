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
 唯一标识符
 */
@property (nonatomic, copy) NSString *identifier;


/**
 成功回执
 */
@property (nonatomic, copy) JDPNetSuccessBlock successBlock;


/**
 失败回执
 */
@property (nonatomic, copy) JDPNetFailureBlock failureBlock;


/**
 初始化方法

 @param request 请求模型
 @return 实例
 */
- (instancetype)initWithRequest:(JDPNetHTTPRequest *)request;

@end
