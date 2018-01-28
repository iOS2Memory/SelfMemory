//
//  ViewController.m
//  HGSelf
//
//  Created by  ZhuHong on 2018/1/28.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "ViewController.h"
#import "HGSelfObject.h"

@interface ViewController ()

@property (nonatomic, strong) HGSelfObject* obj;

@end

@implementation ViewController

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
    
//    [self.obj msg];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
