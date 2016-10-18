//
//  getWeekOfDay.m
//  MyCal
//
//  Created by yangfeiyu on 16/10/5.
//  Copyright © 2016年 yangfeiyu. All rights reserved.
//

#import "getWeekOfDay.h"

@implementation caldate

+ (int)weekdayStringFromDate:(int)inputDate {
    //截取年月日
    int dayNum = inputDate % 100;
    inputDate /= 100;
    int monNum = inputDate % 100;
    int yearNum = inputDate/100;
    
//    printf("%d\n",yearNum);
//    printf("%d\n",monNum);
//    printf("%d\n",dayNum);

    //定义一个NSDateComponents对象，设置为导入的时间点
    NSDateComponents *_comps = [[NSDateComponents alloc] init];
    [_comps setDay:dayNum];
    [_comps setMonth:monNum];
    [_comps setYear:yearNum];
    //一周的数组
//    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null],@"星期天",  @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    //定义一个遵循某个历法的日历对象
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
   
    NSDate *_date = [gregorian dateFromComponents:_comps];
    NSDateComponents *weekdayComponents =
    [gregorian components:NSCalendarUnitWeekday fromDate:_date];
    

    long _weekday = [weekdayComponents weekday];
    //返回星期几
    return (int)(_weekday - 1);
    
}

+ (int)howManyDaysInThisMonth:(int)year:(int)imonth {
    if((imonth == 1)||(imonth == 3)||(imonth == 5)||(imonth == 7)||(imonth == 8)||(imonth == 10)||(imonth == 12))
        return 31;
    if((imonth == 4)||(imonth == 6)||(imonth == 9)||(imonth == 11))
        return 30;
    if((year%4 == 1)||(year%4 == 2)||(year%4 == 3))
    {
        return 28;
    }
    if(year%400 == 0)
        return 29;
    if(year%100 == 0)
        return 28;
    return 29;
}

+(NSString*)monthEnglish:(int)month{
    switch (month) {
        case  1:
            return [[NSMutableString alloc] initWithFormat:@"Jan"];
            break;
        case  2:
            return [[NSMutableString alloc] initWithFormat:@"Feb"];
            break;
        case  3:
            return [[NSMutableString alloc] initWithFormat:@"Mar"];
            break;
        case  4:
            return [[NSMutableString alloc] initWithFormat:@"Apr"];
            break;
        case  5:
            return [[NSMutableString alloc] initWithFormat:@"May"];
            break;
        case  6:
            return [[NSMutableString alloc] initWithFormat:@"Jun"];
            break;
        case  7:
            return [[NSMutableString alloc] initWithFormat:@"Jul"];
            break;
        case  8:
            return [[NSMutableString alloc] initWithFormat:@"Aug"];
            break;
        case  9:
            return [[NSMutableString alloc] initWithFormat:@"Sep"];
            break;
        case  10:
            return [[NSMutableString alloc] initWithFormat:@"Oct"];
            break;
        case  11:
            return [[NSMutableString alloc] initWithFormat:@"Nov"];
            break;
        case  12:
            return [[NSMutableString alloc] initWithFormat:@"Dec"];
            break;
        default:
            break;
    }
    return [[NSMutableString alloc] initWithFormat:@""];;
}

+(int) getNowDate{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate* dt = [NSDate date];
    unsigned unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth |  NSCalendarUnitDay |
    NSCalendarUnitHour |  NSCalendarUnitMinute |
    NSCalendarUnitSecond | NSCalendarUnitWeekday;
    NSDateComponents* comp = [gregorian components: unitFlags
                                          fromDate:dt];
    int nowDate = (int)(comp.year*10000 + comp.month*100 + comp.day);
    return nowDate;
}

+(BOOL) isNumber:(NSString *)str{
    NSString *numberRegex = @"^[0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    BOOL isMatch = [pred evaluateWithObject:str];
    
    if (isMatch) {
        //    NSLog(@"匹配");
        return true;
    } else {
        //    NSLog(@"不匹配");
        return false;
    }
}

+(void) printEx{
    char* exStr = "sorry,please check the command";
    printf("%s\n",exStr);
}

@end
