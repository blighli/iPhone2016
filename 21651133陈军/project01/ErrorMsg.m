//
//  ErrorMsg.m
//  cal
//  
//  Created by Chanjun2016 on 16/10/6.
//  Copyright © 2016年 Chanjun2016. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ErrroMsg.h"

static const char * YEAR_OUT_RANGE  = "cal: year %s not in range 1583..9999";
static const char * MONTH_OUT_RANGE = "cal: %s is neither a month number (1..12) nor a name";
static const char * ARG_LIMIT_EXCEED = "usage: cal [-jy] [[month] year]\n\
        cal [-j] [-m month] [year]\n\
        ncal [-Jjpwy] [-s country_code] [[month] year]\n\
        ncal [-Jeo] [year]";

static const char * ILLEGAL_OPTION = "cal: illegal option -- %c\n\
usage: cal [-jy] [[month] year]\n\
        cal [-j] [-m month] [year]\n\
        ncal [-Jjpwy] [-s country_code] [[month] year]\n\
        ncal [-Jeo] [year]";

static const char * SUCCEED = nil;



@implementation ErrroMsg

+ (const char *)getYEAR_OUT_RANGE{
    return YEAR_OUT_RANGE;
}

+ (const char *)getMONTH_OUT_RANGE{
    return MONTH_OUT_RANGE;
}
+ (const char *)getARG_LIMIT_EXCEED{
    return ARG_LIMIT_EXCEED;
}

+ (const char *)getSUCCEED{
    return SUCCEED;
}

+ (const char *)getILLEGALOPTION{
    return ILLEGAL_OPTION;
}


@end