//
//  MYYearView.m
//  MyCal
//
//  Created by Nick Alan on 10/24/16.
//  Copyright © 2016 Nick Alan. All rights reserved.
//

#import "MYYearView.h"
#import "MYMonthView.h"
#import "MyViewBuffer.h"

enum{
    MYYearViewWidth = 4 + MYMonthViewWidth * 3,
    MYYearViewHeight = 2 + MYMonthViewHeight * 4
};

@interface MYYearView()

-(void)writeTitleOfYear;
-(void)writeMonths;

@end

@implementation MYYearView

-(instancetype)initWithYear:(NSInteger)year
{
    self = [super init];
    if(self)
    {
        _year = year;
        _viewBuffer = [[MyViewBuffer alloc] initWithWidth:MYYearViewWidth andHeight:MYYearViewHeight];
        
        [self writeTitleOfYear];
        [self writeMonths];
    }
    return self;
}

-(void)writeTitleOfYear
{
    NSString *title = [NSString stringWithFormat:@"%ld",(long)_year];
    NSInteger x = (_viewBuffer.width-title.length) / 2 - 1;
    [_viewBuffer writeString:title toX:x andY:0];
}

-(void)writeMonths
{
    for(NSInteger month = 1;month<=12;month++)
    {
        MYMonthView *monthView = [[MYMonthView alloc] initWithMonth:month andYear:_year andStandAlone:NO];
        NSInteger x = (month-1)%3*(monthView.viewBuffer.width+2);
        NSInteger y = 2+(month-1)/3*monthView.viewBuffer.height;
        [_viewBuffer copyFromViewBuffer:monthView.viewBuffer toX:x andY:y];
    }
}
@end
