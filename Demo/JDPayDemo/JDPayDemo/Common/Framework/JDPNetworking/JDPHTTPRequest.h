//
//  JDPHTTPRequest.h
//  NetworkingTest
//
//  Created by Conway on 16/5/18.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDPHTTPRequest : NSObject

/**
 *  服务器URL
 */
@property (nonatomic, strong) NSString *serverURL;

/**
 *  请求参数
 */
@property (nonatomic, copy) NSDictionary *paramDict;

@end
