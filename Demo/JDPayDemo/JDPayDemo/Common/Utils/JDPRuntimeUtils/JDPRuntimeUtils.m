//
//  JDPRuntimeUtils.m
//  RuntimeUtils
//
//  Created by 孔朝阳 on 2017/4/5.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import "JDPRuntimeUtils.h"
#import <objc/runtime.h>

@implementation JDPRuntimeUtils

+ (NSString *)classNameWithClass:(Class)class {
    const char *cClassName = class_getName(class);
    NSString *className = [NSString stringWithUTF8String:cClassName];
    return className;
}

+ (NSArray *)ivarListWithClass:(Class)class {
    unsigned int count;
    Ivar *ivarList = class_copyIvarList(class, &count);
    NSMutableArray *ivarArray = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:2];
        const char *ivarName = ivar_getName(ivarList[i]);
        [dict setObject:[NSString stringWithUTF8String:ivarName] forKey:@"ivarName"];
        const char *ivarType = ivar_getTypeEncoding(ivarList[i]);
        [dict setObject:[NSString stringWithUTF8String:ivarType] forKey:@"ivarType"];
        [ivarArray addObject:dict];
    }
    free(ivarList);
    return [ivarArray copy];
}

+ (NSArray *)propertyListWithClass:(Class)class {
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList(class, &count);
    NSMutableArray *propertyArray = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        const char *cPropertyName = property_getName(propertyList[i]);
        NSString *propertyName = [NSString stringWithUTF8String:cPropertyName];
        [propertyArray addObject:propertyName];
    }
    free(propertyList);
    return [propertyArray copy];
}

+ (NSArray *)methodListWithClass:(Class)class {
    unsigned int count;
    Method *methodList = class_copyMethodList(class, &count);
    NSMutableArray *methodArray = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        [methodArray addObject:NSStringFromSelector(methodName)];
    }
    free(methodList);
    return [methodArray copy];
}

+ (NSArray *)protocolListWithClass:(Class)class {
    unsigned int count;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(class, &count);
    NSMutableArray *protocolArray = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        [protocolArray addObject:[NSString stringWithUTF8String:protocolName]];
    }
    free(protocolList);
    return [protocolArray copy];
}

+ (void)methodExchangeWithClass:(Class)class selector:(SEL)selector1 selector:(SEL)selector2 {
    Method method1 = class_getClassMethod(class, selector1);
    Method method2 = class_getClassMethod(class, selector2);
    method_exchangeImplementations(method1, method2);
}

+ (void)addMethodWithClass:(Class)class selector:(SEL)selector implementationSelector:(SEL)impSelector {
    Method method = class_getInstanceMethod(class, impSelector);
    IMP imp = method_getImplementation(method);
    const char *types = method_getTypeEncoding(method);
    class_addMethod(class, selector, imp, types);
}

@end
