//
//  MYCalendarYearView.m
//  myCal
//
//  Created by liqilei on 2016/10/5.
//  Copyright © 2016年 liqilei. All rights reserved.
//

#import "MYCalendarYearView.h"
#import "MYCalendarMonthView.h"
#import "Utils.h"

enum {
    MYCalendarYearViewRows = 2 + MYCalendarMonthViewRows * 4,
    MYCalendarYearViewColumns = 2 + MYCalendarMonthViewColumns * 3,
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
        
        NSString* stringBuffer = [[NSString string] stringByPaddingToLength: MYCalendarYearViewSize
                                                                 withString:@" "
                                                            startingAtIndex:0];
        _viewBuffer = [NSMutableString stringWithString: stringBuffer];
        
        NSString* yearTitle = [NSString stringWithFormat: @"%ld", (long)year];
        NSInteger yearTitleStartIndex = (MYCalendarYearViewColumns - yearTitle.length - 2) / 2;
        [_viewBuffer replaceCharactersInRange:NSMakeRange(yearTitleStartIndex, yearTitle.length)
                                   withString:yearTitle];

        for(NSInteger i=1; i<=12; i++){
            MYCalendarMonthView* monthView = [[MYCalendarMonthView alloc] initWithMonth: i andYear:year inWholeYear: YES];
            [monthView writeMonthToBuffer:_viewBuffer withColumns:MYCalendarYearViewColumns];
        }
    }
    return self;
}

- (void) printView
{
    for(NSInteger row = 0; row < MYCalendarYearViewRows; row++) {
        NSString* rowString = [_viewBuffer substringWithRange: NSMakeRange(MYCalendarYearViewColumns * row, MYCalendarYearViewColumns)];
        println(rowString);
    }
}

@end
