//
//  ViewController.m
//  Project2
//
//  Created by chenming on 16/10/22.
//  Copyright © 2016年 chenming. All rights reserved.
//

#import "ViewController.h"
#import "MYMonthView.h"
#import "MYYearView.h"
#import "MYViewBuffer.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *year;
@property (weak, nonatomic) IBOutlet UITextField *month;
@property (weak, nonatomic) IBOutlet UIButton *showButton;
@property (weak, nonatomic) IBOutlet UISwitch *isShowAll;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //NSInteger year = 2016 ;
    self.textView.font = [UIFont boldSystemFontOfSize:9];
    //self.textView.text = printYear(year) ;
    self.textView.editable = NO ;
    self.textView.text = @"";
    self.isShowAll.on = NO ;
    
    //[self.showButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.showButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside] ;
    [self.isShowAll addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
}

- (void)buttonClicked{
    //self.textView.text = @"aaa" ;
    NSString *yearStr = self.year.text ;
    NSString *monthStr = self.month.text;
    //判断年份是否int
    for (int i=0;i<[yearStr length];i++) {
        char s = [yearStr characterAtIndex:i] ;
        if(s<'0'||s>'9'){
            self.textView.text = @"year is not in range 1..9999";
            return ;
        }
    }
    //判断年份是否非法
    int yearInt = yearStr.intValue;
    if(yearInt<1||yearInt>9999){
        self.textView.text = @"year is not in range 1..9999";
        return ;
    }
    //打印整年
    if([monthStr isEqualToString: @"1...12"]){
        self.textView.text = printYear(yearInt) ;
    }
    //打印某一月
    else{
        //判断月份是否int
        for (int i=0;i<[monthStr length];i++) {
            char s = [monthStr characterAtIndex:i] ;
            if(s<'0'||s>'9'){
                self.textView.text = @"month is neither a month number (1..12)";
                return ;
            }
        }
        //判断月份是否非法
        int monthInt = monthStr.intValue;
        if(monthInt<1||monthInt>9999){
            self.textView.text = @"month is neither a month number (1..12)";
            return ;
        }
        self.textView.text = printMonth(monthInt, yearInt);
    }
}

- (void)switchChange{
    if(self.isShowAll.on == YES){
        self.month.text = @"1...12" ;
        self.month.enabled = NO;
    }
    else{
        self.month.text = @"" ;
        self.month.enabled = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

NSString * printYear(NSInteger year) {
    MYYearView* view = [[MYYearView alloc] initWithYear:year];
    return [view.viewBuffer display];
}
NSString * printMonth(NSInteger month, NSInteger year) {
    MYMonthView* view = [[MYMonthView alloc] initWithMonth:month andYear:year andStandAlone:YES];
    return [view.viewBuffer display];
}
@end
