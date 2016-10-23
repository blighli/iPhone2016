//
//  ViewController.m
//  Calendar
//
//  Created by Benjamin on 16/10/23.
//  Copyright © 2016年 Benjamin. All rights reserved.
//

#import "ViewController.h"
#import "Days.h"
#import "JudgeNumberRegex.h"
#import "PrintYearAndMonth.h"
#import "YearAndMonthNow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //计算当前年月
    int year, yue;
    YearAndMonthNow * yearAndMonthNow = [[YearAndMonthNow alloc]init];
    [yearAndMonthNow yearAndMonth];
    year = yearAndMonthNow.yearNow;
    //yue = yearAndMonthNow.monthNow;
    yue = 11;
    NSArray * xingqi = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    
    for (int i = 0; i<7; i++) {
        //创建自定义按钮
        UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.frame=CGRectMake(20+45*i, 40, 45, 45);
        
        [btn setTitle:xingqi[i] forState:UIControlStateNormal];
        
        [self.view addSubview:btn];
    }
    
    NSNumber *none = [[NSNumber alloc] initWithInt:0];
    NSNumber *jan = [[NSNumber alloc] initWithInt:31];
    NSNumber *febLeap = [[NSNumber alloc] initWithInt:29];
    NSNumber *febNotLeap = [[NSNumber alloc] initWithInt:28];
    NSNumber *mar = [[NSNumber alloc] initWithInt:31];
    NSNumber *apr = [[NSNumber alloc] initWithInt:30];
    NSNumber *may = [[NSNumber alloc] initWithInt:31];
    NSNumber *jun = [[NSNumber alloc] initWithInt:30];
    NSNumber *jul = [[NSNumber alloc] initWithInt:31];
    NSNumber *aug = [[NSNumber alloc] initWithInt:31];
    NSNumber *sep = [[NSNumber alloc] initWithInt:30];
    NSNumber *oco = [[NSNumber alloc] initWithInt:31];
    NSNumber *nov = [[NSNumber alloc] initWithInt:30];
    NSNumber *dec = [[NSNumber alloc] initWithInt:31];
    
    NSMutableArray * monthArray=[[NSMutableArray alloc]init];
    
    if ([Days isLeapYear:year]) {
        NSArray * arr = [[NSArray alloc]initWithObjects:none,jan,febLeap,mar,apr,may,jun,jul,aug,sep,oco,nov,dec, nil];
        
        [monthArray addObjectsFromArray:arr];
    }else{
        NSArray * arr = [[NSArray alloc]initWithObjects:none,jan,febNotLeap,mar,apr,may,jun,jul,aug,sep,oco,nov,dec, nil];
        
        [monthArray addObjectsFromArray:arr];
    }
    
    int day,maxday,position,count=1;
    day=[Days daysOfUntilLastMonth:year yue:yue];
    position = day % 7 + 1;
    maxday = [monthArray[yue] intValue];
    
    NSLog(@"%d",maxday);

    //循环创建42个按钮
    for(int i=0;i<6;i++){
        for (int j=0; j<7; j++) {
            //创建自定义按钮
            UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
            
            btn.frame=CGRectMake(20+45*j,85+45*i, 45, 45);
            
            if (position >0) {
                position--;
            }else{
               [btn setTitle:[NSString stringWithFormat:@"%d",count++] forState:UIControlStateNormal];
            }
            
            [self.view addSubview:btn];
            
            //将按钮的标志位赋值
            btn.tag = i*7+j + 100;
            
            if (count > maxday) {
                break;
            }
        }
        if (count > maxday) {
            break;
        }
    }
    
    self.view.backgroundColor=[UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
