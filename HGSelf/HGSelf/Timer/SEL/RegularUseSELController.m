//
//  RegularUseSELController.m
//  HGSelf
//
//  Created by  ZhuHong on 2018/2/27.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

// 定时器正常工作,但是当你返回上一个控制器的时候,会发现这个控制器没有销毁,同时定时器还在工作.

#import "RegularUseSELController.h"

@interface RegularUseSELController ()

@end

@implementation RegularUseSELController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)timerAction {
    NSLog(@"定时器在工作 %@", [NSThread currentThread]);
}

- (void)dealloc {
    NSLog(@"RegularUseSELController = 亲亲的,我走了");
}

@end
