//
//  ViewController.m
//  UIWindow-HitTest-Demo
//
//  Created by Xuzixiang on 2017/11/7.
//  Copyright © 2017年 frankxzx. All rights reserved.
//

#import "ViewController.h"
#import "OverlayController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    OverlayController *controller = [[OverlayController alloc]init];
    [controller performSelector:NSSelectorFromString(@"show")];
}

- (IBAction)windowAclickAction:(UIButton *)sender {
    NSLog(@"click window A");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
