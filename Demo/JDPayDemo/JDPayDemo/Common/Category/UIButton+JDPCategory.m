//
//  UIButton+JDPCategory.m
//  JDPayDemo
//
//  Created by Conway on 2018/1/1.
//  Copyright © 2018年 JDJR. All rights reserved.
//

#import "UIButton+JDPCategory.h"
#import <objc/runtime.h>

static const void * kAssociatedObjectUIButtonKey = @"kAssociatedObjectUIButtonKey";

@implementation UIButton (JDPCategory)

+ (instancetype)jdp_buttonWithTitle:(NSString *)title
                               type:(UIButtonType)type
                            handler:(void (^) (void))handler {
    UIButton *button = [UIButton buttonWithType:type];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:button action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    void (^block) (void) = ^() {
        handler();
    };
    objc_setAssociatedObject(button, kAssociatedObjectUIButtonKey, block, OBJC_ASSOCIATION_COPY);
    return button;
}

- (void)buttonAction:(UIButton *)button {
    void (^block) (void) = objc_getAssociatedObject(button, kAssociatedObjectUIButtonKey);
    block();
}

@end
