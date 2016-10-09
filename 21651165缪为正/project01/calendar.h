//
//  calendar.h
//  project1
//
//  Created by 缪为正 on 16-10-4.
//  Copyright (c) 2016年 缪为正. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface calendar : NSObject

@property NSArray *monthArray;
@property NSArray *weekdayArray;
@property NSMutableString *weekday;
@property NSInteger yearNow;
@property NSInteger monthNow;

@property NSMutableArray *daysOfMonth;
@property NSNumber *none;
@property NSNumber *jan;
@property NSNumber *febLeap;
@property NSNumber *febNotLeap;
@property NSNumber *mar;
@property NSNumber *apr;
@property NSNumber *may;
@property NSNumber *jun;
@property NSNumber *jul;
@property NSNumber *aug;
@property NSNumber *sep;
@property NSNumber *oco;
@property NSNumber *nov;
@property NSNumber *dec;

- (void) printYear:(int)year AndMonth:(int)month;
- (void) printYear:(int) year;
- (bool) isLeapYear:(int)year;
- (int) days:(int)month;
- (void) printYearAndMonthNow;
@end
