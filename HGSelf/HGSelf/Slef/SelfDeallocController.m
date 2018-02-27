//
//  SelfDeallocController.m
//  HGSelf
//
//  Created by  ZhuHong on 2018/1/29.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "SelfDeallocController.h"
#import "HGSelfObject.h"

@interface SelfDeallocController ()

@property (nonatomic, strong) HGSelfObject* obj;

@end

@implementation SelfDeallocController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.obj = [HGSelfObject new];
    
    __weak typeof(self) weakSelf = self;
    self.obj.deallocSlef = ^{
        weakSelf.obj = nil;
    };
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_obj msg];
    
    // 这里没有问题
//    [self.obj msg];
}


@end
