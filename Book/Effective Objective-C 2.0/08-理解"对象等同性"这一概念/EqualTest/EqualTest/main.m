//
//  main.m
//  EqualTest
//
//  Created by Conway on 16/3/20.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *firstString = @"Conway77";
        NSLog(@"%p", firstString);
        NSLog(@"%lu", (unsigned long)[firstString hash]);
        NSString *secondString = [NSString stringWithFormat:@"Conway%d", 77];
        NSLog(@"%p", secondString);
        NSLog(@"%lu", (unsigned long)[secondString hash]);
        
        BOOL equal1 = firstString == secondString;
        NSLog(@"%@", equal1 ? @"YES" : @"NO");
        BOOL equal2 = [firstString isEqual:secondString];
        NSLog(@"%@", equal2 ? @"YES" : @"NO");
        BOOL equal3 = [firstString isEqualTo:secondString];
        NSLog(@"%@", equal3 ? @"YES" : @"NO");
        BOOL equal4 = [firstString isEqualToString:secondString];
        NSLog(@"%@", equal4 ? @"YES" : @"NO");
        
        NSArray *array = [NSArray array];
        NSSet *set = [NSSet set];
        
    }
    return 0;
}
