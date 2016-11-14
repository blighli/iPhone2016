//
//  ViewController.m
//  Calendar
//
//  Created by 郁飞范 on 16/10/16.
//  Copyright © 2016年 yufeifan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) calendarView* calView;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	calendarView *view = [[calendarView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
	self.calView = view;
	[self.calView setBackgroundColor:[UIColor redColor]];
	[self.view addSubview:self.calView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	
}

@end
