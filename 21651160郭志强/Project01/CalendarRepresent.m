//
//  CalendarRepresent.m
//  Cal
//
//  Created by 郭志强 on 16/9/29.
//  Copyright © 2016年 Armas. All rights reserved.
//

#import "CalendarRepresent.h"

@implementation CalendarRepresent


+(NSDateComponents*) customComponents:(int) year month:(int) m{
    //自定义date,设定为指定年份月份的1号
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSDate *selfDate = [formatter dateFromString:[NSString stringWithFormat:@"%i-%i-1",year,m]];
    
    //先定义一个遵循阳历的日历对象
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //通过已定义的日历对象，获取某个时间点的NSDateComponents表示，并设置需要表示哪些信息（NSYearCalendarUnit, NSMonthCalendarUnit, NSDayCalendarUn等）
    NSDateComponents *components = [greCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:selfDate];
    
    return components;
}

+(NSArray*) printMonth:(int) year month:(int) m daysOfMonth:(int) length{
    
    NSDateComponents *components = [CalendarRepresent customComponents:year month:m];
    
    //当月第一天星期几
    NSInteger theFirstDay = [components weekday];
    
    NSMutableString *outString = [NSMutableString stringWithCapacity:100];
    //预留首行空位
    NSMutableString *space = [NSMutableString stringWithCapacity:14];
    for(int i_weekDay = (int)theFirstDay;i_weekDay > 1;i_weekDay--){
        [space appendString:@"   "];
    }
    //确定1号位置
    [outString appendString:[space copy]];
    
    for(int i = 1,weekDay = (int)theFirstDay;i <= length && weekDay <= 7;i++,weekDay++){
        //个位日期右对齐
        if(i<10){
            if(weekDay == 7){//星期六换行
                [outString appendFormat:@"  %i\n",i];
                weekDay = 0;
            }else{
                [outString appendFormat:@"  %i",i];
            }
        }else{
            if(weekDay == 7){//星期六换行
                [outString appendFormat:@" %i\n",i];
                weekDay = 0;
            }else{
                [outString appendFormat:@" %i",i];
            }
        }
        
        //将最后一行补齐，与前面的日期右对齐
        if(i == length){
            for(int space = weekDay;space < 7;space++)
                [outString appendString:@"   "];
        }
    }
    
    //输出
    //NSLog(@"%@",[outString copy]);
    
    NSArray *array = [outString componentsSeparatedByString:@"\n"];
    
    return array;
}

-(void) printWholeYear:(int) year{
    //先定义一个遵循阳历的日历对象
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSLog(@"                               %i年                      ",year);
    for(int month = 1;month <= 10;month+=3){
        //每个月天数
        int daysOfMonth[3];
        
        for(int i = 0;i < 3;i++){
            //自定义date,设定为指定年份月份的1号
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyy-MM-dd";
            NSDate *selfDate = [formatter dateFromString:[NSString stringWithFormat:@"%i-%i-1",year,month+i]];
            
            daysOfMonth[i] = (int)[greCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:selfDate].length;
        }
    
        //获取三个月的字符串数组
        NSArray *array[3] = {[CalendarRepresent printMonth:year month:month daysOfMonth:daysOfMonth[0]],
                            [CalendarRepresent printMonth:year month:month+1 daysOfMonth:daysOfMonth[1]],
                            [CalendarRepresent printMonth:year month:month+2 daysOfMonth:daysOfMonth[2]]};
        //确定最长的数组，
        int array_count_max = 0;
        if([array[0] count] >= [array[1] count])
            array_count_max = (int)[array[0] count];
        else
            array_count_max = (int)[array[1] count];
        
        if([array[2] count] >= array_count_max)
            array_count_max = (int)[array[2] count];
        
        //将原数组拷入可变数组，并将每个数组添加新元素（空行），使每个数组长度相同
        NSMutableArray *tempArray[3] = {[NSMutableArray arrayWithArray:array[0]],
            [NSMutableArray arrayWithArray:array[1]],[NSMutableArray arrayWithArray:array[2]]};
        for(int i = 0;i < 3;i++){
            
            for(int length = (int)[array[i] count];length < array_count_max;length++)
                [tempArray[i] addObject:@"                      "];
        }
        
        //声明新的NSMutableArray，将3个数组每一个元素分别拼接组成新数组
        NSMutableArray *bigArray = [NSMutableArray arrayWithCapacity:array_count_max];
        
        for(int i = 0;i < array_count_max;i++){
            NSMutableString *tempString = [NSMutableString stringWithCapacity:100];
            [tempString appendString:[tempArray[0] objectAtIndex:i]];
            [tempString appendString:@"   "];
            [tempString appendString:[tempArray[1] objectAtIndex:i]];
            [tempString appendString:@"   "];
            [tempString appendString:[tempArray[2] objectAtIndex:i]];
            [bigArray addObject:tempString];
        }
        
        NSLog(@"        %i月                     %i月                      %i月",month,month+1,month+2);
        NSLog(@" 日 一 二 三 四 五 六    日 一 二 三 四 五 六    日 一 二 三 四 五 六");
        
        for(int i = 0;i < [bigArray count];i++)
            NSLog(@"%@",[bigArray objectAtIndex:i]);

        
    }
}

@end
