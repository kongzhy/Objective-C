//
//  JDPNetBizHTTPRequest.h
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/28.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import "JDPNetHTTPRequest.h"

@interface JDPNetBizHTTPRequest : JDPNetHTTPRequest


/**
 请求成功编码，默认为@0
 如果返回resultCode在successCodes中，为业务成功，否者为失败
 
 */
@property (nonatomic, copy) NSArray *successCodes;

/**
 返回码
 */
@property (nonatomic, copy) NSString *resultCode;

/**
 返回消息
 */
@property (nonatomic, copy) NSString *resultMsg;

/**
 返回数据
 */
@property (nonatomic, strong) id resultData;

/**
 返回控制
 */
@property (nonatomic, strong) id resultCtrl;

@end
