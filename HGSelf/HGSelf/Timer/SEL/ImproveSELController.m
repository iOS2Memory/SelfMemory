//
//  ImproveSELController.m
//  HGSelf
//
//  Created by  ZhuHong on 2018/2/27.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

// 主要是解决了 常规用法 中出现的问题

#import "ImproveSELController.h"

@interface ImproveSELController ()

// 注意, 这里尽然是weak也是没有问题的, 这是有原因的
@property (nonatomic, weak) NSTimer* timer;

@end

@implementation ImproveSELController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    // strong --->  weak
    self.timer = timer;
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // 在当界面消失的时候, 停止定时器运行
    [self stopTimer];
}

// 暂停定时器
- (void)stopTimer {
    // 一定要加这一句的, 否则定时器根本停不下来
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)timerAction {
    NSLog(@"定时器在工作 %@", [NSThread currentThread]);
}

- (void)dealloc {
    NSLog(@"ImproveSELController = 亲亲的,我走了");
    
//    NSLog(@"%@", self.timer);
}

@end
