//
//  Calendar.h
//  cal
//
//  Created by Chanjun2016 on 16/10/6.
//  Copyright © 2016年 Chanjun2016. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

typedef enum{
    unKnown,
    currentMon,
    givenMonYear,
    givenYear,
}SpecifiedFuncType;

@interface Calendar : NSObject

- (id) init;

+ (Calendar*) getInstance;

- (char *) handleInput :(int)argn :(const char* [])argv;

- (void)calWithCurMon:(int)mon : (int)year :(int)weekFirst;
- (void)calWithGivenMon: (int)mon Year: (int)year;
- (void)calWithGivenYear:(int)year;

- (void)printMonthHeadLine:(int)mon :(int)year;

- (void)printYearOfRow:(int)row;

- (int)printMonRow:(int)row : (int)days : (int)weekFirst;

- (int)countDaysOfMonth:(int)year : (int)month;

+ (int)convertIntValue:(const char*)str;

+ (int)getWeekFirstOfMon:(int)year :(int)mon;

- (void)display;

@property int year;
@property int month;
@property int day;
@property int week;
@property NSMutableString* buffer;

@end

/* Calendar_h */