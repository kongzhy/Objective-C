//
//  JDPRequestManager.m
//  NetworkingTest
//
//  Created by Conway on 16/5/18.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#import "JDPRequestManager.h"
#import "AFNetworking.h"

@implementation JDPRequestManager

+ (NSString *)sendAsynchronousRequest:(JDPHTTPRequest *)request
                              success:(void (^)(JDPHTTPRequest *request, id  responseObject))success
                              failure:(void (^)(JDPHTTPRequest *request, NSError * error))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.operationQueue.maxConcurrentOperationCount = 4;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];    
    NSURLSessionDataTask *task = [manager POST:request.serverURL parameters:request.paramDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(request, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(request, error);
    }];
    return [NSString stringWithFormat:@"%ld", task.taskIdentifier];
}
@end
