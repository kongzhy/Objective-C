//
//  main.m
//  LiteralTest
//
//  Created by Conway on 16/3/13.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // NSString
        NSString *string = @"Effective Objective-C";
        NSMutableString *mutableString =  [@"Effective Objective-C" mutableCopy];
        NSLog(@"%@", mutableString);
        
        // NSNumber
        NSNumber *intergeNumber = @1;
        NSNumber *floatNumber = @1.1;
        NSNumber *charNumber = @'C';
        NSNumber *boolNumber = @YES;
        
        // NSArray
        NSArray *animals = @[@"dog", @"cat", @"mouse"];
        NSLog(@"%@", animals);
        NSLog(@"%@", animals[1]);
        
        // NSDictionary
        NSDictionary *name = @{@"firstName" : @"Kong", @"lastName" : @"Zhaoyang"};
        NSLog(@"%@", name);
        NSLog(@"%@", name[@"firstName"]);
    }
    return 0;
}
