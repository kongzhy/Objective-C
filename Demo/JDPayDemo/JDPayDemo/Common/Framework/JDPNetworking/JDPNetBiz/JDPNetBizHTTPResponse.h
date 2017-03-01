//
//  JDPNetBizHTTPResponse.h
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/28.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import "JDPNetHTTPResponse.h"

@interface JDPNetBizHTTPResponse : JDPNetHTTPResponse

@property (nonatomic, copy) NSString *resultCode;

@property (nonatomic, copy) NSString *resultMsg;

@property (nonatomic, copy) NSObject *resultData;

@property (nonatomic, copy) NSObject *resultCtrl;

@end
