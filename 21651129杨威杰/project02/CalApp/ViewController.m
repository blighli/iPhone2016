//
//  ViewController.m
//  CalApp
//
//  Created by yangwj on 16/10/18.
//  Copyright © 2016年 yangwj. All rights reserved.
//

#import "ViewController.h"
#import <CalFramework/Util.h>

@interface ViewController ()
- (IBAction)datePicked:(UIDatePicker *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIFont * monoFont = [UIFont fontWithName:@"Menlo Regular" size:50.0];
    _mUITextView.font = monoFont;
    
    [self generateCalWithDate:_mUIDatePicker];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)datePicked:(UIDatePicker *)sender {
    @autoreleasepool {
        [self generateCalWithDate:sender];
    }
}

// 在TextView中显示某年某月的日历方阵
- (void)generateCalWithDate:(UIDatePicker *)sender {
    // 获取DatePicker的年月
    NSDate * date = [sender date];
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth;
    NSDateComponents * comps = [calendar components:unitFlags fromDate:date];
    
    NSInteger year = [comps year];
    NSInteger month = [comps month];
    
    
    NSMutableString * str = [Util generatewithYear:year withMonth:month];
    _mUITextView.text = str;
}


@end
