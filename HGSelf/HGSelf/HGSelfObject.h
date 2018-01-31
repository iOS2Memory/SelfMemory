//
//  HGSelfObject.h
//  HGSelf
//
//  Created by  ZhuHong on 2018/1/28.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGSelfObject : NSObject

// 属性
@property (nonatomic, copy) void (^deallocSlef)(void);

// 消息
- (void)msg;

// 故意报错, 建议看看这篇文章
 详细介绍，请参考大神文章： http://blog.sunnyxx.com/2015/01/17/self-in-arc/


@end
