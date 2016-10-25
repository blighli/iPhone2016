//
//  Calender.h
//  cal
//
//  Created by 刘杰 on 16/10/8.
//  Copyright © 2016年 刘杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJCalender : NSObject
+(bool) isLegal:(const char *)str;
+(void) showCalendar:(NSUInteger)year minMonth:(NSUInteger)minMonth maxMonth:(NSUInteger)maxMonth times:(NSUInteger)times;

@end
