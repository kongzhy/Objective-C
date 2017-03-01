//
//  JDPNetParse.m
//  JDPNetworkingDemo
//
//  Created by 孔朝阳 on 2017/2/27.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import "JDPNetParse.h"

@implementation JDPNetParse

+ (NSData *)dataWithJSONObject:(NSObject *)object {
    if (!object) {
        NSLog(@"Object is nil!");
        return nil;
    }
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    
#ifdef DEBUG
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", string);
#endif
    
    if (error) {
        NSLog(@"Error:%@", error);
        return nil;
    }
    return data;
}

+ (NSObject *)JSONObjectWithData:(NSData *)data {
    if (!data) {
        NSLog(@"Data is nil");
        return nil;
    }
    NSError *error = nil;
#ifdef DEBUG
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", string);
#endif
    NSObject *object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"Error:%@", error);
        return nil;
    }
    return object;
}

@end
