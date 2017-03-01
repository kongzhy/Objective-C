//
//  JDPNetManager.m
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/27.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import "JDPNetManager.h"
#import "JDPNetHTTPSession.h"

@interface JDPNetManager ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) NSMutableDictionary *operationDict;

@end

@implementation JDPNetManager

#pragma mark - LifeCycle

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [[JDPNetManager alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _operationDict = [[NSMutableDictionary alloc] init];
        _operationQueue = [[NSOperationQueue alloc] init];
        // 设置最大并发数
        // _operationQueue.maxConcurrentOperationCount = 4;
    }
    return self;
}


#pragma mark - Public

- (NSString *)sendAsynchronousRequest:(JDPNetHTTPRequest *)request
                              success:(JDPNetSuccessBlock)successBlock
                              failure:(JDPNetFailureBlock)failureBlock
{
    JDPNetHTTPSession *session = [[JDPNetHTTPSession alloc] initWithRequest:request];
    session.successBlock = successBlock;
    session.failureBlock = failureBlock;
    
    // 存入字典
    [_operationDict setObject:session forKey:session.identifier];
    [_operationQueue addOperation:session];
    return session.identifier;
}

- (void)cancelRequestWithIdentifier:(NSString *)identifier {
    JDPNetHTTPSession *session = [_operationDict objectForKey:identifier];
    [_operationDict removeObjectForKey:identifier];
    [session cancel];
}

@end
