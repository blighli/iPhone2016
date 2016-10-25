//
//  YFFCalendar.h
//  cal
//
//  Created by 郁飞范 on 16/10/8.
//  Copyright © 2016年 yufeifan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFFCalendar : NSObject

-(void)showCurrentMonth;
-(void)showCurrentYearWithMonth:(NSInteger)month;
-(void)showAllTheYear:(NSInteger)year;
-(void)showMonth:(NSInteger)month andYear:(NSInteger)year;

@end
