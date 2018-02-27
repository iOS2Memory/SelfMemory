//
//  WeakStrongBlockController.m
//  HGSelf
//
//  Created by  ZhuHong on 2018/1/29.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "WeakStrongBlockController.h"

#ifndef    weakify_self
#define weakify_self __weak typeof(self) weakSelf = self
#endif
#ifndef    strongify_self
#define strongify_self __strong __typeof__(weakSelf) self = weakSelf
#endif

typedef void(^WeakStrongBlock)(void);

@interface WeakStrongBlockController ()

@property (nonatomic, copy) WeakStrongBlock wsBlock00;
@property (nonatomic, copy) WeakStrongBlock wsBlock01;

@end

@implementation WeakStrongBlockController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    weakify_self;
    self.wsBlock00 = ^{
        strongify_self;
        NSLog(@"wsBlock00 被执行, %@", self);
        
        self.wsBlock01 = ^{
            // 必须要加
            strongify_self;
            NSLog(@"wsBlock01 被执行, %@", self);
        };
    };
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.wsBlock00) {
        self.wsBlock00();
    }
    
    if (self.wsBlock01) {
        self.wsBlock01();
    }
    
}

- (void)dealloc {
    NSLog(@"\nWeakStrongBlockController -- 亲亲的,我走了");
}


@end
