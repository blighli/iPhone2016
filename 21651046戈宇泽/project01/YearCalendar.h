//
//  YearCalendar.h
//  cal
//
//  Created by 戈宇泽 on 16/10/8.
//  Copyright © 2016年 戈宇泽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MonthCalendar.h"

@interface YearCalendar : NSObject

@property (nonatomic, assign) NSInteger _year;            //年历的年份
@property (nonatomic, retain) NSMutableArray *_monthArray;//月历数组


+(void)initYearCalendar:(NSInteger[24][21])yearCal;//对年历二维数组初始化为0

-(instancetype)initWithYear:(NSInteger)year;//初始化年历对象
-(void)setMonthArray:(NSInteger[24][21])yearCal;//把每个月的月历填到年历数组对应位置
-(void)printYearCalendar:(NSInteger[24][21])yearCal;//打印当前年历
@end
