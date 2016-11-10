//
//  Tool.h
//  MyCalendar
//
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject

+(int)getWeekOfFirstDayOfMonth:(int)year withMonth:(int)month;
+(int)getDaysOfMonth:(int)year withMonth:(int)month;
+(int)getYear;
+(int)getMonth;
+(int)getDay;


@end
