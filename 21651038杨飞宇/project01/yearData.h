//
//  yearData.h
//  MyCal
//
//  Created by yangfeiyu on 16/10/5.
//  Copyright © 2016年 yangfeiyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "monthData.h"

@interface yearData : monthData
{
    @public
    NSMutableArray *yearMonth ;
    @private
    int m_year;
    int m_day[24][21];
}

-(void) setYearData:(int)year;

-(void) setEveryDay;

-(void) printYearData;
@end
