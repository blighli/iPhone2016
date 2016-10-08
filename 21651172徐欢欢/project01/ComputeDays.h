//
//  ComputeDays.h
//  MyCalendar
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 admin. All rights reserved.
//

#ifndef ComputeDays_h
#define ComputeDays_h

#import <Foundation/Foundation.h>

@interface ComputeDays : NSObject

+ (BOOL)isLeapYear:(int)year;

+ (int)daysOfUntilLastYear:(int)year;

+ (int)daysOfUntilLastMonth:(int)year mon:(int)mon;

@end


#endif /* ComputeDays_h */
