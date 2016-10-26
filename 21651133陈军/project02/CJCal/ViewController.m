//
//  ViewController.m
//  CJCal
//
//  Created by Chanjun2016 on 16/10/25.
//  Copyright © 2016年 Chanjun2016. All rights reserved.
//

#import "ViewController.h"
@import libmycal;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *viewCal;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dateChanged:(UIDatePicker *)sender {
    
    UIDatePicker* dp = (UIDatePicker*)sender;
    NSDate* date = [dp date];
    NSCalendar* cal = [NSCalendar currentCalendar];
    NSInteger year = [cal component:NSCalendarUnitYear fromDate:date];
    NSInteger month = [cal component:NSCalendarUnitMonth fromDate:date];
    //NSInteger day = [cal component:NSCalendarUnitDay fromDate:date];
    
    [[Calendar getInstance] calWithGivenMon:month Year:year];
    
    NSString * content = [NSString stringWithFormat:@"%@",[[Calendar getInstance] buffer]];

    _viewCal.font = [UIFont fontWithName:@"courier" size:25];
    
    [[[Calendar getInstance] buffer] setString:@""];
    
    [_viewCal setText:content];
    
}

@end
