//
//  NSTimer+JDPCategory.m
//  NSTimerTest
//
//  Created by Conway on 2018/5/6.
//  Copyright © 2018年 JDJR. All rights reserved.
//

#import "NSTimer+JDPCategory.h"

@implementation NSTimer (JDPCategory)

+ (NSTimer *)jdp_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^) (void))block {
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(jdp_blockInvoke:) userInfo:[block copy] repeats:YES];
}

+ (void)jdp_blockInvoke:(NSTimer *)timer {
    void (^block) (void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
