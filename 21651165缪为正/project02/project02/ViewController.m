//
//  ViewController.m
//  project02
//
//  Created by 缪为正 on 16-10-17.
//  Copyright (c) 2016年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "calendar.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *mycalendar;
@property (weak, nonatomic) IBOutlet UIDatePicker *myDatePicker;


@end

@implementation ViewController
- (IBAction)mydate:(id)sender {
    NSDate *date = [sender date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps=[[NSDateComponents alloc] init];
    comps = [cal components:(NSYearCalendarUnit) fromDate:date];
    int year= [comps year];
    comps = [cal components:(NSMonthCalendarUnit) fromDate:date];
    int month = [comps month];
//    NSString *str = [NSString stringWithFormat:@"%i",year];
    calendar * mycal = [[calendar alloc] init];
    [_mycalendar setText:[mycal printYear:year AndMonth:month]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps=[[NSDateComponents alloc] init];
    comps = [cal components:(NSYearCalendarUnit) fromDate:date];
    int year= [comps year];
    comps = [cal components:(NSMonthCalendarUnit) fromDate:date];
    int month = [comps month];
    calendar * mycal = [[calendar alloc] init];
    [_mycalendar setText:[mycal printYear:year AndMonth:month]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
