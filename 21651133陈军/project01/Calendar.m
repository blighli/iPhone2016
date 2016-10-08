//
//  Calendar.m
//  cal
//
//  Created by Chanjun2016 on 16/10/6.
//  Copyright © 2016年 Chanjun2016. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Calendar.h"
#import "ErrroMsg.h"

#define PRINT_BLANKSPACE(x) for (int _ = 0; _ < (x); ++_){\
printf(" ");\
}


static Calendar* instance = nil;

static const char *num[] = {"Janurary","February","March","Apri","May",
                            "June","July","August","September","October",
                            "November","December",};

@implementation Calendar
/*
 实现简单的单例模式
 */
+ (Calendar*)getInstance{
    if (instance == nil){
        instance = [[Calendar alloc] init];
    }
    return instance;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    if (instance == nil){
        instance = [super allocWithZone:zone];
    }
    return instance;
}

/*
 重写init方法
 */
- (id)init{
    self = [super init];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|
    NSCalendarUnitDay|NSCalendarUnitWeekday;
    NSDateComponents *d = [cal components:unitFlags fromDate:[NSDate date]];
    
    _year = [d year];
    _month = [d month];
    _day = [d day];
    _week = [d weekday];
    
    return self;
}

/*
 处理输入参数
 */
- (char *)handleInput:(int)argn :(const char *[])argv{
    
    char *rtn = (char*)malloc(sizeof(char)*255);
    
    int tmpM,tmpY;
    
    switch (argn) {
        case 1:
            [self calWithCurMon:_month : _year
                               :((6 -_week + _day) / 7) * 7 + _week - _day];
            break;
        case 2:
            if (argv[1][0] == '-' && strlen(argv[1]) > 1){
                sprintf(rtn,[ErrroMsg getILLEGALOPTION],argv[1][1]);
                break;
            }
            
            tmpY = [Calendar convertIntValue:argv[1]];
            if (tmpY == -1){
                 sprintf(rtn,[ErrroMsg getYEAR_OUT_RANGE],"0");
            }else if (tmpY > 9999 || tmpY < 1583){
                sprintf(rtn,[ErrroMsg getYEAR_OUT_RANGE],argv[1]);
            }else{
                [self calWithGivenYear:[Calendar convertIntValue:argv[1]]];
            }
            break;
        case 3:
            if (argv[1][0] == '-' && strlen(argv[1]) > 1){
                sprintf(rtn,[ErrroMsg getILLEGALOPTION],argv[1][1]);
                break;
            }
            
            tmpM = [Calendar convertIntValue:argv[1]];//??这里不能定义局部变量？
            tmpY = [Calendar convertIntValue:argv[2]];
            
            if (tmpY > 1582 && tmpY <= 9999 ){
                if (tmpM > 12 || tmpM < 1){
                    sprintf(rtn,[ErrroMsg getMONTH_OUT_RANGE],argv[1]);
                }
            }else if (tmpY == -1){
                sprintf(rtn,[ErrroMsg getYEAR_OUT_RANGE],"0");
            }else {
                sprintf(rtn,[ErrroMsg getYEAR_OUT_RANGE],argv[2]);
            }
            
            if (strlen(rtn) == 0){
                [self calWithGivenMon:tmpM Year:tmpY];
            }
            
            break;
        default:
            if (argv[1][0] == '-' && strlen(argv[1]) > 1){
                sprintf(rtn,[ErrroMsg getILLEGALOPTION],argv[1][1]);
            }else{
                sprintf(rtn, [ErrroMsg getARG_LIMIT_EXCEED],nil);
            }
            
            break;
    }
    
    return rtn;
}

/*
 打印当前月份
 */
- (void)calWithCurMon:(int)mon : (int)year :(int)weekFirst{
    [self printMonthHeadLine:mon :year];
    int days = [self countDaysOfMonth: year:mon];
    
    int flag = 1 , row = 0;
    while (flag > 0){
        flag = 0;
        flag += [self printMonRow: row : days :weekFirst];
        ++row;
        printf("\n");
    }
}


/*
 打印指定月份
 */
- (void)calWithGivenMon: (int)mon Year: (int)year{
    int weekFirst = [Calendar getWeekFirstOfMon:year :mon];
    [self calWithCurMon:mon : year : weekFirst];
}


/*
 逐行逐月打印
 */
- (void)calWithGivenYear:(int)year{
    PRINT_BLANKSPACE(32-(log10(year)-1)/2);
    
    printf("%4d\n",year);
    
    for (int i = 0;  i < 4; ++i){
        [self printYearOfRow:i];
        
        int flag = 1,row = 0;
        
        while (flag > 0){
            flag = 0;
            for (int j = 0; j < 3; ++j){
                int days = [self countDaysOfMonth:year :i*3+j+1];
                int weekFirst = [Calendar getWeekFirstOfMon:year :i*3+j+1];
                
                flag += [self printMonRow: row : days :weekFirst];
                PRINT_BLANKSPACE(2);
            }
            ++row;
            printf("\n");
        }
    }
    
}

/*
  打印指定月份的指定行
 */
- (int)printMonRow:(int)row : (int)days : (int)weekFirst{
    
    if (row == 0){
        PRINT_BLANKSPACE(weekFirst*3-1);
        
        for (int i = weekFirst; i < 7; ++i){
            i == 0?printf("%2d",i-weekFirst+1):printf("%3d",i-weekFirst+1);
        }
        
        return 1;
    }
    
    int start = 7 * (row - 1) + 8 - weekFirst;
    
    int i = 0;
    for (; i < 7 && i+start <= days; ++i){
        i == 0?printf("%2d",i+start):printf("%3d",i+start);
    }
    
    if (i < 7){
        int k = i == 0 ? 20 : 21;
        PRINT_BLANKSPACE((k-3*i));
    }
    
    return start <= days;
}

/*
 获取某年某月有多少天
 */
- (int)countDaysOfMonth:(int)year : (int)month{
    int a[] = {0,31,28,31,30,31,30,31,31,30,31,30,31};
    if (month == 2){
        return a[month]+ ((year%4==0 && year%100!=0) || (year % 400 ==0));
    }
    
    return a[month];
}

- (void)printMonthHeadLine:(int)mon :(int)year{
    printf("    %s %d\nSu Mo Tu We Th Fr Sa\n",num[mon-1],year);
}

- (void)printYearOfRow:(int)row{
    
    PRINT_BLANKSPACE(10-strlen(num[row*3])/2);
    printf("%s",num[row*3]);
    PRINT_BLANKSPACE(10-strlen(num[row*3])/2 + 2);
    
    PRINT_BLANKSPACE(10-strlen(num[row*3+1])/2);
    printf("%s",num[row*3+1]);
    PRINT_BLANKSPACE(10-strlen(num[row*3+1])/2 + 2);
    
    PRINT_BLANKSPACE(10-strlen(num[row*3+2])/2);
    printf("%s",num[row*3+2]);
    PRINT_BLANKSPACE(10-strlen(num[row*3+2])/2 + 2);
    
    printf("\n");
    printf("Su Mo Tu We Th Fr Sa");
    printf("  Su Mo Tu We Th Fr Sa");
    printf("  Su Mo Tu We Th Fr Sa\n");
}

/*
 字符串-->整数
 */
+ (int)convertIntValue:(const char*)str{
    
    if (*str > '9' || *str < '0'){
        return -1;
    }
    
    int num = 0;
    
    while (*str!='\0'){
        if (*str > '9' || *str < '0'){
            break;
        }
        
        num = num * 10 + (*str - '0');
        ++str;
    }
    return num;
}

/*
 蔡勒公式:
    适用范围：1582年10月15日以后
 */
+ (int)getWeekFirstOfMon:(int)year :(int)mon{
    if (mon < 3){
        year -= 1;
        mon += 12;
    }
    
    int c = year / 100, y = year - c * 100;
    
    int weekFirst = (c/4) - 2*c + y + y/4 + (26*(mon+1) / 10) + 1 - 1;
    weekFirst = (weekFirst % 7 + 7) % 7;
    return weekFirst;
}

@end