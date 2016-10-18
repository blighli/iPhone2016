//
//  MonthCalendar.h
//  cal
//
//  Created by 戈宇泽 on 16/10/8.
//  Copyright © 2016年 戈宇泽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MonthCalendar : NSObject

@property (nonatomic, assign) NSInteger _year;//本月所属年份
@property (nonatomic, assign) NSInteger _month;//本月是几月
@property (nonatomic, assign) NSInteger _days;//本月天数
@property (nonatomic, assign) NSInteger _weekday;//本月第一天是星期几
@property (nonatomic, retain) NSDate *_date;//本月第一天的date


+(NSString*)convert:(NSInteger) month;//把月份数字转化为月份字符串

//初始化月历数组
-(instancetype)initWithMonth:(NSInteger)month AndYear:(NSInteger)year;
-(void)printMonthOfYear:(NSInteger[6][7])monthCal;//打印当前月历

-(void)setMonthCal:(NSInteger[6][7])monthCal;//填充月历二维数组
+(void)initMonthCalendar:(NSInteger[6][7])monthCal;//初始化月历二维数组为0
@end