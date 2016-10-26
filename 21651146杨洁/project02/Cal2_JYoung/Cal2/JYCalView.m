//
//  JYCallView.m
//  Cal2
//
//  Created by JYoung on 17/10/2016.
//  Copyright © 2016 JYoung. All rights reserved.
//

#import "JYCalView.h"

@interface JYCalView ()

@property (nonatomic, strong) UIFont *font;

@end

@implementation JYCalView

+ (instancetype)callViewWithDateString:(NSString *)dateString {
    JYCalView *call = [JYCalView new];
    call.dateString = dateString;
    return call;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont fontWithName:@"Monaco" size:15.0f];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.font = [UIFont fontWithName:@"Monaco" size:15.0f];
}

- (void)setDateString:(NSString *)dateString {
    _dateString = dateString;
    CGSize size = [dateString sizeWithAttributes:@{NSFontAttributeName : self.font}];
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)drawRect:(CGRect)rect {
    [_dateString drawInRect:self.bounds withAttributes:@{NSFontAttributeName : self.font, NSForegroundColorAttributeName : [UIColor blackColor]}];
}

@end
