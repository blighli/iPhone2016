//
//  MYMonthCalendarView.h
//  myCal
//
//  Created by liqilei on 2016/10/5.
//  Copyright © 2016年 liqilei. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    MYCalendarMonthViewRows = 8,
    MYCalendarMonthViewColumns = 21,
    MYCalendarMonthViewDayWidth = 3,
    MYCalendarMonthViewSize = MYCalendarMonthViewRows * MYCalendarMonthViewColumns
};

@interface MYCalendarMonthView : NSObject

+ (NSArray*) monthNames;

- (instancetype) initWithMonth: (NSInteger) month andYear: (NSInteger) year;
- (void) printView;

@end
