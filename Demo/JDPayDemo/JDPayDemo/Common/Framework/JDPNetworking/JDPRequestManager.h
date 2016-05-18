//
//  JDPRequestManager.h
//  NetworkingTest
//
//  Created by Conway on 16/5/18.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDPHTTPRequest.h"

@interface JDPRequestManager : NSObject

+ (NSString *)sendAsynchronousRequest:(JDPHTTPRequest *)request
                              success:(void (^)(JDPHTTPRequest *request, id  responseObject))success
                              failure:(void (^)(JDPHTTPRequest *request, NSError * error))failure;
@end
