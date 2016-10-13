//
//  JudgeNumber.m
//  MyCalendar
//
//  Created by admin on 16/10/5.
//  Copyright © 2016年 admin. All rights reserved.
//


#import "JudgeNumber.h"

@implementation JudgeNumber

- (BOOL) isNumber:(NSString *)str{
    
    NSString *numberRegex = @"^[0-9]+$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",numberRegex];
    
    BOOL isMatch = [pred evaluateWithObject:str];
    
    if (isMatch) {
        return true;
    }else{
        return false;
    }
    
}

@end
