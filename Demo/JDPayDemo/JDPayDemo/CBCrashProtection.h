//
//  CBCrashProtection.h
//  CBiOSFramework
//
//  Created by LiangKaifeng on 11/4/15.
//  Copyright © 2015 chinabank payments. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSArray (CrashProtection)
- (id)CB_objectAtIndex:(NSUInteger)index;
@end

@interface NSMutableArray (CrashProtection)
- (id)CB_objectAtIndex:(NSUInteger)index;

- (void)CB_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
@end


@interface NSMutableDictionary (CrashProtection)
- (void)CB_setObject:(id)anObject forKey:(id <NSCopying>)aKey;
@end

@interface UIView (CrashProtection)
- (void)safe_addSubview:(UIView *)view;
@end


@interface NSString (CrashProtection)
- (NSString *)CB_substringToIndex:(NSUInteger)to;
@end