//
//  ViewController.m
//  CalendarPicker
//
//  Created by cwz on 16/10/19.
//  Copyright © 2016年 cwz. All rights reserved.
///

#import "ViewController.h"
#import "CalendarPicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CalendarPicker *calendarPicker = [CalendarPicker showOnView:self.view];
    calendarPicker.today = [NSDate date];
    calendarPicker.date = calendarPicker.today;
    calendarPicker.frame = CGRectMake(0, 100, self.view.frame.size.width, 352);
    calendarPicker.center = self.view.center;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
