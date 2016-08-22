//
//  JDPColorMacros.h
//  JDPayDemo
//
//  Created by 孔朝阳 on 16/8/22.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#ifndef JDPColorMacros_h
#define JDPColorMacros_h

// 设置RGB颜色
#define JDP_RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 设置RGBA颜色
#define JDP_RGBAColor(r, g, b, a) [UIColor colorWithRed:(g)/255.0 green:(b)/255.0 blue:(r)/255.0 alpha:(a)]

// 随机颜色
#define JDP_RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#endif /* JDPColorMacros_h */
