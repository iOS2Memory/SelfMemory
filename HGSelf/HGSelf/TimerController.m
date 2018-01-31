//
//  TimerController.m
//  HGSelf
//
//  Created by  ZhuHong on 2018/1/31.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "TimerController.h"
#import "HGSelfObject.h"

@interface TimerController ()

@property (nonatomic, strong) NSObject* obj;

// 注意, 这里尽然是weak也是没有问题的, why
@property (nonatomic, weak) NSTimer* timer;

@end

@implementation TimerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.obj = [[HGSelfObject alloc] init];
    __weak typeof(self) weakSelf = self;
    NSTimer* timer =  [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        // 不会内存泄露
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"哈哈哈哈哈, %@, %@", strongSelf.obj, strongSelf);
        
        // 内存泄露了
//        NSLog(@"%@", self.obj);
    }];
    
    // strong --->  weak
    self.timer = timer;
    
}


- (void)dealloc {
    NSLog(@"亲亲的,我走了");
    
    // 尽然这个还有值, 为什么
    NSLog(@"%@", self.timer);
    
    // 一定要加这一句的, 否则定时器根本停不下来
    {
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
