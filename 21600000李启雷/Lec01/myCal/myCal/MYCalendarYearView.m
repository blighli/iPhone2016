//
//  MYCalendarYearView.m
//  myCal
//
//  Created by liqilei on 2016/10/5.
//  Copyright © 2016年 liqilei. All rights reserved.
//

#import "MYCalendarYearView.h"
#import "MYCalendarMonthView.h"

enum {
    MYCalendarYearViewRows = 8,
    MYCalendarYearViewColumns = 21,
    MYCalendarYearViewDayWidth = 3,
    MYCalendarYearViewSize = MYCalendarYearViewRows * MYCalendarYearViewColumns
};

@interface MYCalendarYearView()
{
    NSMutableString* _viewBuffer;
}
@end



@implementation MYCalendarYearView

- (instancetype) initWithYear: (NSInteger) year
{
    self = [super init];
    if (self) {
        
//        NSString* stringBuffer = [[NSString string] stringByPaddingToLength: MYMonthCalendarViewSize
//                                                                 withString:@" "
//                                                            startingAtIndex:0];
//        _viewBuffer = [NSMutableString stringWithString: stringBuffer];

    }
    return self;
}

@end
