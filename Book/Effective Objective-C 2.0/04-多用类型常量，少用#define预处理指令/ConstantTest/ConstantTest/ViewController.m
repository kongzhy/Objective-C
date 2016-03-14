//
//  ViewController.m
//  ConstantTest
//
//  Created by Conway on 16/3/13.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#import "ViewController.h"

#define ANIMATION_DURATION 3

NSString *const JDPNotification = @"JDPNotification";

static const NSTimeInterval kAnimationDuration = 3;
static  NSString *const name = @"Cownay";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", name);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self startAnimation];
}

- (void)startAnimation {
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.view.backgroundColor = [UIColor redColor];
    } completion:^(BOOL finished) {
        
    }];
}

@end
