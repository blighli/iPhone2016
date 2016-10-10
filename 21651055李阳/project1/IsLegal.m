//
//  IsLegal.m
//  MyCal
//
//  Created by 李阳 on 2016/10/8.
//  Copyright © 2016年 李阳. All rights reserved.
//

#import "IsLegal.h"

@implementation IsLegal
-(BOOL)isNumber:(NSString *)str{
    //这个是匹配数字字符串的正则表达式
    NSString * numberRegex=@"^[0-9]+$";
    
    NSPredicate * pred=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",numberRegex];
    
    BOOL isMatch=[pred evaluateWithObject:str];
    
    if (isMatch) {
        //NSLog(@"匹配");
        return true;
    }else{
        //NSLog(@"不匹配");
        return false;
    }
}
@end

