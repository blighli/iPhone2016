//
//  MyCalView.m
//  MyCalPaint
//
//  Created by SuperleeOS on 16/10/26.
//  Copyright © 2016年 SuperleeOS. All rights reserved.
//

#import "MyCalView.h"
#import "SLCal.h"

@interface MyCalView ()

@property (nonatomic, copy) NSString *dateStr;
@property (nonatomic, strong) NSDictionary *attrs;

@end

@implementation MyCalView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    NSMutableDictionary *attrs = @{}.mutableCopy;
    self.attrs = attrs;
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    attrs[NSFontAttributeName] = [UIFont fontWithName:@"Courier" size:14.0f];
    CGRect frame = self.frame;
    self.dateStr = [SLCal calendarWithArgc:1 argv:NULL];
    frame.size = [self.dateStr sizeWithAttributes:attrs];
    self.frame = frame;
}

- (void)drawRect:(CGRect)rect {
    [self.dateStr drawInRect:self.bounds withAttributes:self.attrs];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.center = self.superview.center;
}

@end
