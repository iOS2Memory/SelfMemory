//
//  UltimateSELController.m
//  HGSelf
//
//  Created by  ZhuHong on 2018/2/27.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

// 什么BUG都不会有了, 如果有的话, 记得告诉我.

// 搞一个中间 Class (HGProxy).
// 这个中间 Class 还不是最好的, 因为看起来很别扭, 主要原因是 proxyAction 与 timerAction 太 饶了.
// 最好的 Class, 请见 YYWeakProxy , 这个 Class 才是终极中的终极. 通用, 易用, 主要是使用了消息转发, 很是强大.
#import <UIKit/UIKit.h>

//@interface HGProxy : NSObject
@interface HGProxy : NSProxy   // 使用 NSProxy 会比使用 NSObject 还要装逼

// 一个中间的属性
@property (nonatomic, weak) id executor;

@end

@implementation HGProxy

// 一个别扭的中间方法
- (void)proxyAction {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [_executor performSelector:@selector(timerAction)];
    
#pragma clang diagnostic pop
    
}

// 查看销毁时机
- (void)dealloc {
    NSLog(@"HGProxy 已经走了");
}

@end

#import "UltimateSELController.h"

@interface UltimateSELController ()

// 注意, 这里尽然是weak也是没有问题的, 这是有原因的
@property (nonatomic, weak) NSTimer* timer;

@end

@implementation UltimateSELController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // NSProxy 不用 init , 其实也木有提供这样的方法, 也木有必要. 在OC中是一个特殊的没有继承于NSObject 的 Class.
    HGProxy* proxy = [HGProxy alloc];
    
    // 设置 executor 的值
    proxy.executor = self;
    
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:1 target:proxy selector:@selector(proxyAction) userInfo:nil repeats:YES];
    
    // strong --->  weak
    self.timer = timer;
}

// 定时器工作
- (void)timerAction {
   NSLog(@"定时器在工作 %@", [NSThread currentThread]);
}

// 暂停定时器
- (void)stopTimer {
    // 一定要加这一句的, 否则定时器根本停不下来
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)dealloc {
    NSLog(@"UltimateSELController = 亲亲的,我走了");
    // 暂停定时器
    [self stopTimer];
}

@end
