//
//  ViewController.m
//  iosCal
//
//  Created by Nick Alan on 10/25/16.
//  Copyright © 2016 Nick Alan. All rights reserved.
//

#import "ViewController.h"
#import "MYMonthView.h"
#import "MYYearView.h"
#import "MyViewBuffer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSInteger year = 0;
    NSInteger month = 0;
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *date = [NSDate date];
    year = [calender component:NSCalendarUnitYear fromDate:date];
    month = [calender component:NSCalendarUnitMonth fromDate:date];
    MYMonthView *view = [[MYMonthView alloc] initWithMonth:month andYear:year andStandAlone:YES];
    NSString *str = [view.viewBuffer display];
    //_lab.font = [UIFont systemFontOfSize:14];
    _lab.font = [UIFont fontWithName:@"Courier" size:20];
    _lab.numberOfLines = 0;
    _lab.textAlignment = NSTextAlignmentLeft;
    _lab.adjustsFontSizeToFitWidth = YES;
    _lab.text = str;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
