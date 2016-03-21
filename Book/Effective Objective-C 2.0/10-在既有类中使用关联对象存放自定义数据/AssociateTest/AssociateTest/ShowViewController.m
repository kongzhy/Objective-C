//
//  ShowViewController.m
//  AssociateTest
//
//  Created by Conway on 16/3/20.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#import "ShowViewController.h"
#import <objc/runtime.h>

// static NSString * const kAlertViewKey = @"AlertViewKey";
static void *kAlertViewKey = @"AlertViewKey";

@interface ShowViewController ()

@end

@implementation ShowViewController

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self showAlertView];
}

- (void)showAlertView {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Question" message:@"What do you want to do?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    void (^block) (NSInteger) = ^(NSInteger buttonIndex) {
        if (0 == buttonIndex) {
            [self doCancel];
        } else {
            [self doContinue];
        }
    };
    objc_setAssociatedObject(alertView, kAlertViewKey, block, OBJC_ASSOCIATION_COPY);
    [alertView show];
}

- (void)doCancel {
    NSLog(@"%s", __func__);
}

- (void)doContinue {
    NSLog(@"%s", __func__);
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    void (^block) (NSInteger) = objc_getAssociatedObject(alertView, kAlertViewKey);
    block(buttonIndex);
}

@end
