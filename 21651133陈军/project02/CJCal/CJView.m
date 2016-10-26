//
//  CJView.m
//  CJCal
//
//  Created by Chanjun2016 on 16/10/26.
//  Copyright © 2016年 Chanjun2016. All rights reserved.
//

#import "CjView.h"
@import libmycal;

#define ROWS 8

@implementation CJView

- (void) drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextFillRect(context, rect);
    
    UIFont* font = [UIFont fontWithName:@"Courier" size:20];
    
    [[Calendar getInstance] calWithGivenMon:10 Year:2016];
    
    NSDictionary* attrs = @{
                            NSFontAttributeName:font
                            };
    CGRect rowRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
    
    [[Calendar getInstance].buffer drawInRect:rowRect withAttributes:attrs];
 
    NSLog(@"%@",[Calendar getInstance].buffer);
    
}

@end