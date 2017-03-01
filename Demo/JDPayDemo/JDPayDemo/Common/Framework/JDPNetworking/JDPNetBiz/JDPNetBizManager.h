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
#import "JDPNetBizHTTPResponse.h"

@interface JDPNetBizManager : NSObject

+ (NSString *)sendAsynchronousRequest:(JDPNetBizHTTPRequest *)bizHTTPRequest
                              success:(JDPNetBizSuccessBlock)successBlock
                              failure:(JDPNetBizFailureBlock)failureBlock;

@end
