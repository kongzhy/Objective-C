//
//  JDPHTTPResponse.h
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/24.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDPNetHTTPResponse : NSObject

/**
 *  解析后的数据对象
 */
@property (nonatomic, strong) NSObject *dataObject;

/**
 *  服务
 */
@property (nonatomic, strong) NSHTTPURLResponse *URLResponse;

@end
