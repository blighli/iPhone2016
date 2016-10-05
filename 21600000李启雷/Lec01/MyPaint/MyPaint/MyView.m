//
//  MyView.m
//  MyPaint
//
//  Created by liqilei on 2016/10/6.
//  Copyright © 2016年 liqilei. All rights reserved.
//

#import "MyView.h"

@implementation MyView


- (void) drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextFillRect(context, CGRectMake(10, 10, 100, 100));
}

@end
