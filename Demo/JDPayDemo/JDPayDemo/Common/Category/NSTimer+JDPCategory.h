//
//  NSTimer+JDPCategory.h
//  NSTimerTest
//
//  Created by Conway on 2018/5/6.
//  Copyright © 2018年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (JDPCategory)

+ (NSTimer *)jdp_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^) (void))block;

@end
