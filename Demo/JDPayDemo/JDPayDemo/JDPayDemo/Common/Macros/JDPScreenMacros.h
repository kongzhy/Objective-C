//
//  JDPScreenMacros.h
//  MacrosTest
//
//  Created by Conway on 16/3/8.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#ifndef JDPScreenMacros_h
#define JDPScreenMacros_h

// 获取当前屏幕尺寸
#define JDP_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define JDP_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

// 判断当前屏幕尺寸
#define JDP_SCREEN_3_5_INCH ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define JDP_SCREEN_4_INCH ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define JDP_SCREEN_4_7_INCH ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define JDP_SCREEN_5_5_INCH ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#endif /* JDPScreenMacros_h */
