//
//  JDPNetBizManager.h
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/27.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDPNetBizDefine.h"
#import "JDPNetBizHTTPRequest.h"


/**
 京东支付 业务网络管理器
 对京东支付网络层的封装，包含了业务需要的请求及返回数据结构，便于调用者直接处理既定的数据结构
 */
@interface JDPNetBizManager : NSObject


/**
 发送异步请求，默认为POST

 @param bizHTTPRequest 请求模型
 @param successBlock 请求成功回执
 @param failureBlock 请求失败回执
 @return 返回会话ID
 */
+ (NSString *)sendAsynchronousRequest:(JDPNetBizHTTPRequest *)bizHTTPRequest
                              success:(JDPNetBizSuccessBlock)successBlock
                              failure:(JDPNetBizFailureBlock)failureBlock;


/**
 取消请求

 @param identifier 会话ID
 */
- (void)cancelRequestWithIdentifier:(NSString *)identifier;

@end
