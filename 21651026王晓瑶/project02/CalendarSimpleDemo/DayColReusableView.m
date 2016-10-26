//
//  DayColReusableView.m
//
//


#import "DayColReusableView.h"

@interface DayColReusableView()
@property (weak, nonatomic) IBOutlet UILabel *label0;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;


@end

@implementation DayColReusableView

- (void)awakeFromNib {
    [super awakeFromNib];

//    UIColor *color1 = [UIColor colorWithRed:255 green:204 blue:204 alpha:0.5];
//    UIColor *color2 = [UIColor colorWithRed:230 green:230 blue:230 alpha:0.5];

    UIColor *color1 = [UIColor groupTableViewBackgroundColor];
    UIColor *color2 = [UIColor groupTableViewBackgroundColor];

    self.label0.backgroundColor = color1;
    self.label2.backgroundColor = color1;
    self.label4.backgroundColor = color1;
    self.label5.backgroundColor = color1;


    self.label1.backgroundColor = color2;
    self.label3.backgroundColor = color2;
    self.label5.backgroundColor = color2;
}


- (void)updateTimer:(NSArray*)array;
{
    self.timerLabel.text = [NSString stringWithFormat:@"%@年%@月",array[0],array[1]];

}

@end
