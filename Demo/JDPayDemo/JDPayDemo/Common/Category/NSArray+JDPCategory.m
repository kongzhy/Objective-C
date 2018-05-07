//
//  NSArray+JDPCategory.m
//  JDPayDemo
//
//  Created by Conway on 2018/1/1.
//  Copyright © 2018年 JDJR. All rights reserved.
//

#import "NSArray+JDPCategory.h"
#import <objc/runtime.h>
@implementation NSArray (JDPCategory)

//+ (void)load {
//    Method method1 = class_getInstanceMethod(NSClassFromString(@"__NSSingleObjectArrayI"), @selector(objectAtIndex:));
//    Method method2 = class_getInstanceMethod(NSClassFromString(@"__NSSingleObjectArrayI"), @selector(jdp_safeObjectAtIndex:));
//    method_exchangeImplementations(method1, method2);
//}
//
//- (id)jdp_safeObjectAtIndex:(NSUInteger)index {
//    if (index >= self.count) {
//        return nil;
//    }
//    return [self jdp_safeObjectAtIndex:index];
//}

@end
