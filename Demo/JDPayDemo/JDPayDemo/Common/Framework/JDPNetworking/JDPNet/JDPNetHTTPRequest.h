//
//  JDPHTTPRequest.h
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/24.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDPNetHTTPRequest : NSObject

/**
 *  服务器URL
 */
@property (nonatomic, copy) NSString *serverURL;

/**
 *  服务
 */
@property (nonatomic, copy) NSString *functionID;


/**
 *  HTTP Method
 */
@property (nonatomic, copy) NSString *HTTPMethod;

/**
 *  超时时间
 */
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/**
 *  请求参数
 */
@property (nonatomic, copy) NSDictionary *paramDict;





/**
 *  服务响应
 */
@property (nonatomic, strong) NSHTTPURLResponse *URLResponse;

/**
 *  解析后的原生数据对象
 */
@property (nonatomic, strong) NSObject *dataObject;

@end
