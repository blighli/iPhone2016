//
//  CalMonth.h
//  CalPrint
//
//  Created by iOSChenYi on 16-10-2.
//  Copyright (c) 2016年 ChenYi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalMonth : NSObject
@property NSUInteger year;
@property NSUInteger month;

//将这个月的每一行输出放到lines中，提高复用效率，并且供CalYear快速使用。
@property NSMutableArray *lines;
//是否有－j这个option。－j用来输出这个月每一天是这一年的第几天。
@property bool jFlag;

- (NSUInteger) numOfDay;
- (NSUInteger) weekDayOfFirstDay;
- (NSUInteger) indexOfFirstDay;
- (id) init;
- (id) initWithMonth:(NSUInteger)month withJFlag:(bool)flag;
- (id) initWithYear:(NSUInteger)year andMonth:(NSUInteger) month;
- (NSString *) toString;
- (NSDate *) date;
- (void) setLines;
@end
