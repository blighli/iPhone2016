//
//  ViewController.m
//  iPhoneCal
//
//  Created by iOSChenYi on 16-10-15.
//  Copyright (c) 2016年 ChenYi. All rights reserved.
//

#import "ViewController.h"
#import "CalMonth.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UILabel* label;
}
- (IBAction)onYearOrMonthChanged:(id)sender {
    NSDate *date=[sender date];
    NSCalendar *cal=[NSCalendar currentCalendar];
    NSDateComponents *comps=[cal components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:date];
    
    CalMonth *month=[[CalMonth alloc] initWithYear:[comps year] andMonth:[comps month]];
    
    [self outputToLabel:month];
}

- (void)outputToLabel:(CalMonth*)month
{
    [label setNumberOfLines:0];
    [label setText:[month toString]];
    
    CGRect screen=[[UIScreen mainScreen] bounds];
    
    CGSize expectSize=[label sizeThatFits:CGSizeMake(screen.size.width, screen.size.height)];
    
    [label setFrame:CGRectMake((screen.size.width-expectSize.width)/2, 15, expectSize.width, expectSize.height)];
    
    [[self view] addSubview:label];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    label=[[UILabel alloc] init];
    
    CalMonth *month=[[CalMonth alloc] init];
    [self outputToLabel:month];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
