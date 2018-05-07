//
//  NSMutableArray+JDPCategory.m
//  Category
//
//  Created by 孔朝阳 on 2017/5/24.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import "NSMutableArray+JDPCategory.h"

@implementation NSMutableArray (JDPCategory)

- (void)jdp_safeAddObject:(id)anObject {
    if (!anObject) {
        return;
    }
    if (anObject == [NSNull null]) {
        return;
    }
    [self addObject:anObject];
}

@end
