//
//  RootViewController.m
//  AssociateTest
//
//  Created by Conway on 16/3/20.
//  Copyright © 2016年 JDJR. All rights reserved.
//

#import "RootViewController.h"
#import "ShowViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[[ShowViewController alloc] init] animated:YES];
}

@end
