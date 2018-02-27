//
//  HGSelfObject.m
//  HGSelf
//
//  Created by  ZhuHong on 2018/1/28.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "HGSelfObject.h"

@implementation HGSelfObject

// 类方法
+ (void)classTest {
    NSLog(@"%@, %@", self, NSStringFromSelector(_cmd));
}

// 实例方法
- (void)test {
    NSLog(@"%@, %@", self, NSStringFromSelector(_cmd));
}

// 调用方法
- (void)msg {
    
    NSLog(@"start = %@", self);
    
    if (self.deallocSlef) {
        // 将本实例设置成nil（销毁）
        self.deallocSlef();
    }
    
    NSLog(@"end %@", self);
}


#pragma mark - weak/strong 按需解决
// 调用方法
- (void)weakmsg {
    
    __weak typeof(self) weakSelf = self;
    NSLog(@"start = %@", weakSelf);
    
    if (weakSelf.deallocSlef) {
        // 将本实例设置成nil（销毁）
        weakSelf.deallocSlef();
    }
    
    // 该对象已经销毁
    NSLog(@"end %@", weakSelf);
}

// 调用方法
- (void)strongmsg {
    
    typeof(self) strongSelf = self;
    NSLog(@"start = %@", strongSelf);
    
    if (strongSelf.deallocSlef) {
        // 将本实例设置成nil（销毁）
        strongSelf.deallocSlef();
    }
    
    // 该对象还没有销毁， 因为还有一个强指针 strongSelf
    NSLog(@"end %@", strongSelf);
    
    // 销毁
}

- (void)dealloc {
    NSLog(@"HGSelfObject -- 亲亲的，我走了");
}

@end
