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
#define JDP_Log(format, ...) NSLog(@"\n(FileName:%s)\n(FuncName:%s)\n(LineNumber:%d)\n"format,__FILE__,__FUNCTION__,__LINE__,##__VA_ARGS__)
#else
#define JDP_Log(format, ...)
#endif

#endif /* JDPLogMacros_h */
