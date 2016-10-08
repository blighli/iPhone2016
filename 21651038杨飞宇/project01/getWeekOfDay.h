//
//  getWeekOfDay.h
//  MyCal
//
//  Created by yangfeiyu on 16/10/5.
//  Copyright © 2016年 yangfeiyu. All rights reserved.
//
#import <Foundation/Foundation.h>
#pragma clang diagnostic ignored "-Wmissing-selector-name"
@interface caldate : NSObject
+ (int)weekdayStringFromDate:(int)inputDate;

+ (int)howManyDaysInThisMonth:(int)year :(int)imonth;

+ (NSString*)monthEnglish:(int)month;

+ (int) getNowDate;

+ (BOOL) isNumber:(NSString*) str;

+ (void) printEx;
@end
