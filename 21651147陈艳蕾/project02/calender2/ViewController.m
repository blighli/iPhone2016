//
//  ViewController.m
//  CalendarPicker
//
//  Created by Sara on 16/10/26.
//  Copyright © 2016年 Sara. All rights reserved.
///

#import "ViewController.h"
#import "CalendarPicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CalendarPicker *calendarPicker = [CalendarPicker showOnView:self.view];
    calendarPicker.today = [NSDate date];
    calendarPicker.date = calendarPicker.today;
    calendarPicker.frame = CGRectMake(0, 50, self.view.frame.size.width, 352);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showAction:(id)sender{
    CalendarPicker *calendarPicker = [CalendarPicker showOnView:self.view];
    calendarPicker.today = [NSDate date];
    calendarPicker.date = calendarPicker.today;
    calendarPicker.frame = CGRectMake(0, 50, self.view.frame.size.width, 352);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
