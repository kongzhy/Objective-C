//
//  UIButton+JDPCategory.h
//  JDPayDemo
//
//  Created by Conway on 2018/1/1.
//  Copyright © 2018年 JDJR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (JDPCategory)

+ (instancetype)jdp_buttonWithTitle:(NSString *)title
                               type:(UIButtonType)type
                            handler:(void (^) (void))handler;
@end
