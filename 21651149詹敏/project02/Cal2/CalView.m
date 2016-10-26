//
//  CalView.m
//  Cal2
//
//  Created by zhanmin on 20/10/2016.
//  Copyright © 2016 zhanmin. All rights reserved.
//

#import "CalView.h"
#import "ZMCal.h"

@interface CalView ()

@property (nonatomic, copy) NSString *dateStr;
@property (nonatomic, strong) NSDictionary *attrs;

@end

@implementation CalView

- (void)awakeFromNib {
    [super awakeFromNib];
    NSMutableDictionary *attrs = @{}.mutableCopy;
    self.attrs = attrs;
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    attrs[NSFontAttributeName] = [UIFont fontWithName:@"Monaco" size:16.0f];
    CGRect frame = self.frame;
    self.dateStr = [ZMCal calendarForDate:[NSDate date]];
    frame.size = [self.dateStr sizeWithAttributes:attrs];
    self.frame = frame;
}

- (void)drawRect:(CGRect)rect {
    [self.dateStr drawInRect:self.bounds withAttributes:self.attrs];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGPoint center = self.superview.center;
    center.y -= 20;
    self.center = center;
}

@end
