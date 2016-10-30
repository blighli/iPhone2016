//
//  JKCalendar.h
//  Project1
//
//  Created by Edward Lin on 2016/10/24.
//  Copyright © 2016年 Edward Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKCalendar : NSObject

@property (nonatomic, copy, readonly) NSString *weekTitle;
@property (nonatomic, copy, readonly) NSArray *monthTitleInYearArray;
@property (nonatomic, copy, readonly) NSString *weekTitleInYear;
@property (nonatomic, copy, readonly) NSArray *monthTitleArray;

- (NSString *)printMonthCalendarWithFirstDayOfMonth:(NSDate *) firstDayOfMonth;
- (NSString *)printYearCalendarWithYear:(int) year;

- (NSArray *)getArrayOfCalendarWithFirstDayOfMonth:(NSDate *) firstDayOfMonth;

@end
