//
//  ViewController.m
//  CalendarShow
//
//  Created by Armas on 10/19/16.
//  Copyright © 2016 Armas. All rights reserved.
//

#import "ViewController.h"
#import <CalLib/CalLib.h>

@interface ViewController ()
    @property (weak, nonatomic) IBOutlet UIDatePicker *dataPicker;
    @property (weak, nonatomic) IBOutlet UITextView *calendarView;

@end

@implementation ViewController

    
- (IBAction)showAction:(UIButton *)sender {
    NSDate* date = [_dataPicker date];//获取datapicker显示值
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    Show* show = [[Show alloc] init];
    NSString* monthCalendar = [show selectMonth:[calendar component:NSCalendarUnitMonth fromDate:date] year:[calendar component:NSCalendarUnitYear fromDate:date]];
    
    _calendarView.text = monthCalendar;
   
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
