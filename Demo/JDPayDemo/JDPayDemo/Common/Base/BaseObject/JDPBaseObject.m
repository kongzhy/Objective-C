//
//  JDPBaseObject.m
//  JDPayDemo
//
//  Created by Conway on 16/2/29.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#import "JDPBaseObject.h"

@implementation JDPBaseObject

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%@", anInvocation.target);
    NSLog(@"%@", NSStringFromSelector(anInvocation.selector));
}

@end
