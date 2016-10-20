//
//  MyView.m
//  MyPaint
//
//  Created by liqilei on 2016/10/6.
//  Copyright © 2016年 liqilei. All rights reserved.
//

#import "MyView.h"
@import libMyCal;

#define ROWS 8

@implementation MyView


- (void) drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextFillRect(context, rect);
    
    NSInteger rowHeight = rect.size.height / ROWS;
    UIFont* font = [UIFont fontWithName:@"Courier" size:30];
    
    MYMonthView* view = [[MYMonthView alloc] initWithMonth:10 andYear:2016 andStandAlone:YES];
    [view.viewBuffer display:^(NSString *str, int row) {
        
        CGRect rowRect = CGRectMake(0, rowHeight * row, rect.size.width, rowHeight);
        
        NSDictionary* attrs = @{
                                NSFontAttributeName:font
                                };
        
        [str drawInRect:rowRect withAttributes:attrs];
        
        NSLog(@"%@",str);
        
    }];
    
}

@end
