//
//  ViewController.m
//  Cal2
//
//  Created by soulghost on 17/10/2016.
//  Copyright © 2016 soulghost. All rights reserved.
//

#import "ViewController.h"
#import "XYTCall.h"

@interface CalView : UIView

@end

@implementation CalView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)drawRect:(CGRect)rect {
    NSString *dateStr = [XYTCall calendarForDate:[NSDate date]];
    UIFont *font = [UIFont fontWithName:@"Monaco" size:15.0f];
    CGSize size = [dateStr sizeWithAttributes:@{NSFontAttributeName : font}];
    [dateStr drawInRect:(CGRect){(rect.size.width - size.width) * 0.5f, 50, size} withAttributes:@{NSFontAttributeName : font, NSForegroundColorAttributeName : [UIColor blackColor]}];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endEditing:YES];
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
