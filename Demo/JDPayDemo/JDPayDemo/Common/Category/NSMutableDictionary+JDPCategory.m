//
//  NSMutableDictionary+JDPCategory.m
//  Category
//
//  Created by 孔朝阳 on 2017/5/24.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import "NSMutableDictionary+JDPCategory.h"

@implementation NSMutableDictionary (JDPCategory)

- (void)jdp_safeSetObject:(id)anObject forKey:(id <NSCopying>)aKey {
    if (!aKey) {
        return;
    }
    if (aKey == [NSNull null]) {
        return;
    }
    
    if (!anObject) {
        return;
    }
    if (anObject == [NSNull null]) {
        return;
    }
    [self setObject:anObject forKey:aKey];
}

@end
