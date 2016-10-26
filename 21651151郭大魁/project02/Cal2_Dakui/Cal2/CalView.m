

#import "CalView.h"
#import "DKCal.h"

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
    attrs[NSFontAttributeName] = [UIFont fontWithName:@"Monaco" size:17.0f];
    CGRect frame = self.frame;
    self.dateStr = [[DKCal sharedCal] calendarForDate:[NSDate date]];
    frame.size = [self.dateStr sizeWithAttributes:attrs];
    self.frame = frame;
}

- (void)drawRect:(CGRect)rect {
    [self.dateStr drawInRect:self.bounds withAttributes:self.attrs];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGPoint center = self.superview.center;
    center.y -= 100;
    self.center = center;
}

@end
