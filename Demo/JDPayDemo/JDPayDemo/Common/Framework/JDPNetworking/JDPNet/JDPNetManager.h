//
//  JDPNetManager.h
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/27.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDPNetHTTPRequest.h"
#import "JDPNetDefine.h"


/**
 京东支付 网络管理器
 */
@interface JDPNetManager : NSObject


/**
 获取单例

 @return 单例
 */
+ (instancetype)sharedManager;


/**
 发起请求

 @param request 请求模型
 @param successBlock 成功回执
 @param failureBlock 失败回执
 @return 会话标识符
 */
- (NSString *)sendAsynchronousRequest:(JDPNetHTTPRequest *)request
                              success:(JDPNetSuccessBlock)successBlock
                              failure:(JDPNetFailureBlock)failureBlock;


/**
 取消请求

 @param identifier 会话标识符
 */
- (void)cancelRequestWithIdentifier:(NSString *)identifier;


/**
 删除会话 内部调用接口

 @param identifier 会话标识符
 */
- (void)removeRequestWithIdentifier:(NSString *)identifier;

@end
