//
//  Judge.m
//  MyFirstProject
//
//  Created by admin on 16/10/8.
//  Copyright © 2016年 xmt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Judge.h"

@implementation Judge

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
