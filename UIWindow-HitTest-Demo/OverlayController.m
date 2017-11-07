//
//  OverlayController.m
//  UIWindow-HitTest-Demo
//
//  Created by Xuzixiang on 2017/11/7.
//  Copyright © 2017年 frankxzx. All rights reserved.
//

#import "OverlayController.h"
#import "ViewController.h"

@interface OverlayController ()

@property(nonatomic, strong) UIWindow *window;
@property (nonatomic,strong) UIButton *button;

@end

@implementation OverlayController

-(void)loadView {
    [super loadView];
    self.view = [[ContentView alloc]init];
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.button];
}

-(void)show {
    self.window.rootViewController = self;
    [self.window makeKeyAndVisible];
}

-(UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _window.windowLevel = UIWindowLevelStatusBar + 1;
        _window.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _window.backgroundColor = [UIColor clearColor];
    }
    return _window;
}

-(UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 80, 30)];
        _button.backgroundColor = [UIColor yellowColor];
        [_button setTitle:@"BBBBB" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

-(void)click:(UIButton *)sender {
    NSLog(@"click from window B");
}

@end

@implementation ContentView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isEqual:self]) {
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        UIView *subview = [window hitTest:point withEvent:event];
//        ViewController *controller = (ViewController *)(window.rootViewController);
//        for (UIView *subview in controller.view.subviews) {
//            if ([subview isMemberOfClass:[UIButton class]]) {
//                return subview;
//            }
//        }
        return subview;
    }
    return view;
}

@end
