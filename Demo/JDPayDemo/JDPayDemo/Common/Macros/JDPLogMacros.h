//
//  JDPLogMacros.h
//  JDPayDemo
//
//  Created by 孔朝阳 on 16/8/22.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#ifndef JDPLogMacros_h
#define JDPLogMacros_h

#ifdef DEBUG
#define JDP_Log(...) NSLog(@"%s Line:%d %@",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define JDP_Log(...)
#endif

#endif /* JDPLogMacros_h */
