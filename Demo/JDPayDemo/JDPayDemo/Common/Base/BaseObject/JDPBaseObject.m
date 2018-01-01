//
//  JDPBaseObject.m
//  JDPayDemo
//
//  Created by Conway on 16/2/29.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#import "JDPBaseObject.h"
#import <objc/runtime.h>

@implementation JDPBaseObject

//+ (BOOL)resolveClassMethod:(SEL)sel {
//    Method method = class_getClassMethod([self class], @selector(dynamicClassMethod));
//    IMP imp = method_getImplementation(method);
//    BOOL success = class_addMethod([self class], sel, imp, nil);
//    return YES;
//}
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    IMP imp = class_getMethodImplementation([self class], @selector(dynamicInstanceMethod));
//    class_addMethod([self class], sel, imp, nil);
//    return YES;
//}
//
//+ (void)dynamicClassMethod {
//    NSLog(@"%s", __func__);
//}
//
//- (void)dynamicInstanceMethod {
//    NSLog(@"%s", __func__);
//}


- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%@", NSStringFromSelector(aSelector));
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%@", anInvocation);
}
@end
