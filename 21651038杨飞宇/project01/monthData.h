//
//  monthData.h
//  MyCal
//
//  Created by yangfeiyu on 16/10/4.
//  Copyright © 2016年 yangfeiyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma clang diagnostic ignored "-Wmissing-selector-name"
@interface monthData : NSObject
{
    
    @public
    NSString *yearAndMonth;
    NSString *weekday;
    int day[6][7];
    @private
    int _year;
}



- (void)setMonthData:(int)year:(int)month;

-(void) printMonthData;
@end
