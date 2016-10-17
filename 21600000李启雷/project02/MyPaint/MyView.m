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
    
    CGContextSetRGBFillColor(context, 0.5, 0, 0.5, 0.4);
    CGContextFillRect(context, CGRectMake(rect.origin.x+10,
                                          rect.origin.y+10,
                                          rect.size.width-20,
                                          rect.size.width - 20));
}

@end
