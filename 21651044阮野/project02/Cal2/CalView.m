//
//  CalView.m
//  Cal2
//
//  Created by 阮野 on 17/10/2016.
//  Copyright © 2016 阮野. All rights reserved.
//

#import "CalView.h"
#import "SLCal.h"

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
    attrs[NSFontAttributeName] = [UIFont fontWithName:@"Monaco" size:14.0f];
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
