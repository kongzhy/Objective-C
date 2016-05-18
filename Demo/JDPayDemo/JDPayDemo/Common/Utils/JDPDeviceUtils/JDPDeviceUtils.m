//
//  JDPDeviceUtils.m
//  DeviceTest
//
//  Created by 孔朝阳 on 16/4/28.
//  Copyright © 2016年 孔朝阳. All rights reserved.
//

#import "JDPDeviceUtils.h"
#import <AdSupport/AdSupport.h>
#import <UIKit/UIKit.h>
@implementation JDPDeviceUtils

+ (NSString *)idfa {
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return idfa;
}

+ (NSString *)idfv {
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return idfv;
}

@end
