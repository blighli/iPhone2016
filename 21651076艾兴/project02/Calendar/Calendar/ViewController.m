//
//  ViewController.m
//  Calendar
//
//  Created by ax on 16/10/20.
//  Copyright © 2016年 aixing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) CalendarView* calView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CalendarView *view = [[CalendarView alloc] initWithFrame:CGRectMake(10, 10, [[UIScreen mainScreen] bounds].size.width-10, [[UIScreen mainScreen] bounds].size.height)];
    self.calView = view;
    [self.calView setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:self.calView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
