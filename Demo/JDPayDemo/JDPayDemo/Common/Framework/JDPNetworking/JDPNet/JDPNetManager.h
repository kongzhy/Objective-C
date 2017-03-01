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

@interface JDPNetManager : NSObject

+ (instancetype)sharedManager;

- (NSString *)sendAsynchronousRequest:(JDPNetHTTPRequest *)request
                              success:(JDPNetSuccessBlock)successBlock
                              failure:(JDPNetFailureBlock)failureBlock;

- (void)cancelRequestWithIdentifier:(NSString *)identifier;

- (void)removeRequestWithIdentifier:(NSString *)identifier;

@end
