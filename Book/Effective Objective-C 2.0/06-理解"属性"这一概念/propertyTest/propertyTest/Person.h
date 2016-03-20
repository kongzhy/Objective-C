//
//  Person.h
//  propertyTest
//
//  Created by Conway on 16/3/19.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

/**
 *  原子性
 *  atomic:默认,通过锁定机制来确保操作的原子性,影响性能
 *  nonatomic:约定俗成,在iOS中使用同步锁的开销较大,会带来性能问题
 */
@property (atomic) NSString *firstName;

/**
 *  读写权限
 *  readwrite:默认,拥有设置方法和获取方法
 *  readonly:仅拥有获取方法
 */
@property (nonatomic, readwrite) NSString *lastName;

/**
 *  内存管理语义
 *  assign:只能用于纯量类型,简单赋值操作
 *  strong:设置方法先保留新值,释放旧值,设置新值
 *  weak:只能用于对象类型,简单赋值,当属性所指的对象销毁时，属性值也会清空
 *  unsafe_unretained:适用于对象类型,简单赋值
 *  copy:拷贝新值，释放旧值，设置新值
 */
@property (nonatomic, readwrite, assign) NSInteger age;

/**
 *  方法名
 *  getter =
 *  setter =
 */
@property (nonatomic, getter=isMan) BOOL man;

@end
