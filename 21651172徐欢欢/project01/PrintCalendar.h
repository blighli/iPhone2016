//
//  PrintCalendar.h
//  MyCalendar
//
//  Created by admin on 16/10/6.
//  Copyright © 2016年 admin. All rights reserved.
//

#ifndef PrintCalendar_h
#define PrintCalendar_h

#import <Foundation/Foundation.h>

@interface PrintCalendar :NSObject

- (void) printmonth:(int)year mon:(int)mon;
- (void) printyear:(int)year;

@end

#endif /* PrintCalendar_h */
