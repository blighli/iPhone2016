//
//  ViewController.m
//  LJHCalendarPicker
//
//  Created by 李江浩 on 16/10/19.
//  Copyright © 2016年 李江浩. All rights reserved.
///

#import "ViewController.h"
#import "LJHCalendarPicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showAction:(id)sender{
    LJHCalendarPicker *calendarPicker = [LJHCalendarPicker showOnView:self.view];
    calendarPicker.today = [NSDate date];
    calendarPicker.date = calendarPicker.today;
    calendarPicker.frame = CGRectMake(0, 100, self.view.frame.size.width, 352);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
