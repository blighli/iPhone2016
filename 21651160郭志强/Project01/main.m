//
//  main.m
//  Cal
//
//  Created by 郭志强 on 16/9/29.
//  Copyright © 2016年 Armas. All rights reserved.
//

#import "CalendarRepresent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //    先定义一个遵循某个历法的日历对象
        NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        CalendarRepresent *calendarRepresent = [CalendarRepresent new];
        
        
        //[calendarRepresent printWholeYear:2016];
        
        if(argc == 1){
            //通过已定义的日历对象，获取某个时间点的NSDateComponents表示，并设置需要表示哪些信息（NSYearCalendarUnit, NSMonthCalendarUnit, NSDayCalendarUn等）
            NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:[NSDate date]];
            
            NSRange daysOfThisMonth = [greCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
            
            NSArray *array = [CalendarRepresent printMonth:(int)[dateComponents year] month:(int)[dateComponents month] daysOfMonth:(int)daysOfThisMonth.length];
            
            //Sunday:1, Monday:2, Tuesday:3, Wednesday:4, Thursday:5, Friday:6, Saturday:7
            NSLog(@"     %ld月 %ld年",(long)[dateComponents month],(long)[dateComponents year]);
            NSLog(@" 日 一 二 三 四 五 六");
            
            for(int i = 0;i < [array count];i++){
                NSLog(@"%@",array[i]);
            }
//            NSMutableString* last = [NSMutableString stringWithCapacity:100];
//            [last appendString:@"\n"];
//            for(int i = 0;i < [array count];i++){
//                [last appendFormat:@"%@\n",array[i]];
//            }
//            
//            NSLog(@"%@",last);
        }else if(argc == 2){ //打印整年日期
            NSString* string = [[NSString alloc] initWithUTF8String:argv[1]];
            NSScanner* scan = [NSScanner scannerWithString:string];
            int val;
            if(([scan scanInt:&val])&&[scan isAtEnd] == YES){
                if(val<1 || val > 9999)
                    return 1;
                [calendarRepresent printWholeYear:val];
            }
            else{
                NSLog(@"year %@ not in range 1..9999",string);
                return 0;
            }
            
        }else if(argc == 3){
            int year,month;
            NSString* string_1 = [[NSString alloc] initWithUTF8String:argv[1]];
            NSString* string_2 = [[NSString alloc] initWithUTF8String:argv[2]];
            
            NSScanner* scan_1 = [NSScanner scannerWithString:string_1];
            NSScanner* scan_2 = [NSScanner scannerWithString:string_2];
            
            BOOL _month_ilegal = [scan_1 scanInt:&month]&&[scan_1 isAtEnd];
            BOOL _year_ilegal = [scan_2 scanInt:&year]&&[scan_2 isAtEnd];
            if(_month_ilegal == YES && _year_ilegal == YES){
                
                if(year<1 || year > 9999){
                    NSLog(@"year %@ not in range 1..9999",string_2);
                    return 0;
                }else if(month<1 || month > 12){
                    NSLog(@"%@ is neither a month number (1..12) nor a name",string_1);
                    return 0;
                }
                
                //    先定义一个遵循某个历法的日历对象
                NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                
                //自定义date,设定为指定年份月份的1号
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"yyyy-MM-dd";
                NSDate *selfDate = [formatter dateFromString:[NSString stringWithFormat:@"%i-%i-1",year,month]];
                NSRange daysOfMonth = [greCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:selfDate];

                NSArray *array = [CalendarRepresent printMonth:year month:month daysOfMonth:(int)daysOfMonth.length];
                
                //Sunday:1, Monday:2, Tuesday:3, Wednesday:4, Thursday:5, Friday:6, Saturday:7
                NSLog(@"     %d月 %d年",month,year);
                NSLog(@" 日 一 二 三 四 五 六");
                
                for(int i = 0;i < [array count];i++){
                    NSLog(@"%@",array[i]);
                }
            }
            else{
                if(_year_ilegal == NO){
                    NSLog(@"year %@ not in range 1..9999",string_2);
                }
                else if(_month_ilegal == NO)
                    NSLog(@"%@ is neither a month number (1..12) nor a name",string_1);
                
                return 0;
            }
        }
        
        else{
            
            NSLog(@"args:[null] | [year] | [month] [year]");
            return 0;
        }
    }
    return 0;
}
