//
//  CBCrashProtection.m
//  CBiOSFramework
//
//  Created by LiangKaifeng on 11/4/15.
//  Copyright © 2015 chinabank payments. All rights reserved.
//

#import "CBCrashProtection.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@implementation NSObject(CrashProtection)
+ (void)swizzleClassMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
    Method otherMehtod = class_getClassMethod(class, otherSelector);
    Method originMehtod = class_getClassMethod(class, originSelector);

    method_exchangeImplementations(otherMehtod, originMehtod);
}

+ (void)swizzleInstanceMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
    Method otherMehtod = class_getInstanceMethod(class, otherSelector);
    Method originMehtod = class_getInstanceMethod(class, originSelector);

    method_exchangeImplementations(otherMehtod, originMehtod);
}
@end

@implementation NSArray(CrashProtection)
+ (void)load
{
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayI") originSelector:@selector(objectAtIndex:) otherSelector:@selector(CB_objectAtIndex:)];
}

- (id)CB_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self CB_objectAtIndex:index];
    } else {
        return nil;
    }
}

@end

@implementation NSMutableArray(CrashProtection)
+ (void)load
{
    //[self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(objectAtIndex:) otherSelector:@selector(CB_objectAtIndex:)];
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(replaceObjectAtIndex:withObject:) otherSelector:@selector(CB_replaceObjectAtIndex:withObject:)];
}

- (id)CB_objectAtIndex:(NSUInteger)index
{
    @autoreleasepool {
    if (index < self.count) {
        return [self CB_objectAtIndex:index];
    } else {
        return nil;
    }
    }
}

- (void)CB_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if ((index < [self count])&&anObject) {
        [self CB_replaceObjectAtIndex:index withObject:anObject];
    }
}

@end

@implementation NSString(CrashProtection)
+ (void)load
{
    [self swizzleInstanceMethod:NSClassFromString(@"NSString") originSelector:@selector(substringToIndex:) otherSelector:@selector(CB_substringToIndex:)];

}

- (NSString *)CB_substringToIndex:(NSUInteger)to
{
    if (to > [self length]) {
        return @"";
    }
    else {
        return [self CB_substringToIndex:to];
    }
}

@end

@implementation NSMutableDictionary(CrashProtection)

+ (void)load
{
    [self swizzleInstanceMethod:NSClassFromString(@"__NSDictionaryM") originSelector:@selector(setObject:forKey:) otherSelector:@selector(CB_setObject:forKey:)];
}

- (void)CB_setObject:(id)anObject forKey:(id <NSCopying>)aKey
{
    if (anObject == nil || aKey == nil) {
        return;
    }
    
    [self CB_setObject:anObject forKey:aKey];
}



@end