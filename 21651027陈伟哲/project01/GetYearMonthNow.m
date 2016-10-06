//
//  GetYearMonthNow.m
//  Cal
//
//  Created by cwz on 16/10/4.
//  Copyright © 2016年 cwz. All rights reserved.
//

#import "GetYearMonthNow.h"

@implementation GetYearMonthNow

-(void) yearMonth{
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags  = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    NSDateComponents *dateComponents = [cal components:unitFlags fromDate:date];
    _year = (int)[dateComponents year];
    _month = (int)[dateComponents month];
    
}

-(BOOL) judgeNumberRegex:(NSString*)str{
    NSString *numberRegex = @"^[0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",numberRegex];
    BOOL isMatch = [pred evaluateWithObject:str];
    if(isMatch){
        return true;
    }else{
        return false;
    }
}
@end
