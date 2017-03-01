//
//  JDPNetParse.h
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/27.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDPNetParse : NSObject

+ (NSData *)dataWithJSONObject:(NSObject *)object;

+ (NSObject *)JSONObjectWithData:(NSData *)data;

@end
