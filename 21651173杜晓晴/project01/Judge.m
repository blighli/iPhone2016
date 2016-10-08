//
//  JudgeNumberRegex.m
//  Calendar
//
//  Created by duxiaoqing on 10/6/16.
//  Copyright © 2016 duxiaoqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Judge.h"

@implementation JudgeNumberRegex


- (BOOL) isNumber:(NSString*)str{
    
    //这个是匹配数字字符串的正则表达式；
    NSString *numberRegex = @"^[0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    BOOL isMatch = [pred evaluateWithObject:str];
    
    if (isMatch) {
        //    NSLog(@"匹配");
        
        return true;
    } else {
        //    NSLog(@"不匹配");
        
        return false;
    }  
}  

@end