//
//  CommonDayColCell.m
//
//

#import "CommonDayColCell.h"

@implementation CommonDayColCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.dayLabel.backgroundColor = [UIColor clearColor];
    self.dayLabel.font = [UIFont systemFontOfSize:14];
    self.dayLabel.textColor = [UIColor colorWithRed:51 green:53 blue:58 alpha:1];

    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
}

+ (UINib *)nib{
    return [UINib nibWithNibName:@"CommonDayColCell" bundle:nil];
}

@end
