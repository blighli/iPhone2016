//
//  judgeNumberRegex.m
//  calendar
//
//  Created by 李江浩 on 2016/10/5.
//  Copyright © 2016年 李江浩. All rights reserved.
//

#import "judgeNumberRegex.h"

@implementation judgeNumberRegex
- (BOOL)isNumber:(NSString *)str{
    NSString *numberRegex = @"^[0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",numberRegex];
    return [predicate evaluateWithObject:str];
}
//- (instancetype)init{
//    if(self = [super init]){
//    }
//    return self;
//}
@end
