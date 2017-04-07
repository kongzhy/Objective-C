//
//  JDPRuntimeUtils.h
//  RuntimeUtils
//
//  Created by 孔朝阳 on 2017/4/5.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDPRuntimeUtils : NSObject


/**
 获取类名

 @param class class
 @return 类名
 
 */
+ (NSString *)classNameWithClass:(Class)class;


/**
 获取实例变量数组，元素为字典，字典中存储变量类型和变量名称

 @param class class
 @return 实例变量列表
 */
+ (NSArray *)ivarListWithClass:(Class)class;


/**
 获取属性列表

 @param class class
 @return 属性列表
 */
+ (NSArray *)propertyListWithClass:(Class)class;


/**
 获取方法列表

 @param class class
 @return 方法列表
 */
+ (NSArray *)methodListWithClass:(Class)class;


/**
 获取协议列表

 @param class class
 @return 协议列表
 */
+ (NSArray *)protocolListWithClass:(Class)class;

/**
 方法交换

 @param class class
 @param selector1 选择子1
 @param selector2 选择子2
 */
+ (void)methodExchangeWithClass:(Class)class selector:(SEL)selector1 selector:(SEL)selector2;


/**
 添加方法

 @param class class
 @param selector 添加选择子
 @param impSelector 实现选择子
 */
+ (void)addMethodWithClass:(Class)class selector:(SEL)selector implementationSelector:(SEL)impSelector;

@end
