//
//  NSMutableDictionary+JDPCategory.h
//  Category
//
//  Created by 孔朝阳 on 2017/5/24.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (JDPCategory)

- (void)jdp_safeSetObject:(id)anObject forKey:(id <NSCopying>)aKey;

@end
