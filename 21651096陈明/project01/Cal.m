//
//  Cal.m
//  Project1
//
//  Created by chenming on 16/10/7.
//  Copyright © 2016年 chenming. All rights reserved.
//

#import "Cal.h"
@implementation Cal

//判断是不是闰年
-(BOOL) isLeapYear:(int)year{
    if ( year%400==0 || (year%4==0&&year%100!=0) )
        return YES ;
    else
        return NO ;
}
//打印第一行周日到周六
-(void)printWeek{
   NSLog(@"日 一 二 三 四 五 六");
    
}
//打印三次第一行周日到周六
-(void)printWeek3{
    printf("日 一 二 三 四 五 六   日 一 二 三 四 五 六   日 一 二 三 四 五 六\n");
    
}
//获取本月第一天是周几
-(int)getFirstDayInMonth:(int)month andYear:(int)year{
    NSArray *daysInMonth ;
    
    if ( [self isLeapYear:year] ){
        daysInMonth = [NSArray arrayWithObjects:@"31",@"29",@"31", @"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31",nil];
    }
    else{
        daysInMonth = [NSArray arrayWithObjects:@"31",@"28",@"31", @"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31",nil];
    }
    
    //计算本年第一天是周几 z是几就是周几
    int z = ((year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400) % 7 + 1 ;
    
    //本月第一天的位置
    //日     一  。。。。。 五      六
    //0位置  1位置 。。。。 5位置   6位置
    int day = 0 ;
    for(int i=1;i< month;i++){
        day = day + [[daysInMonth objectAtIndex:(i-1)] intValue];
    }
    return (day + z) % 7;
}
//打印本行的三个月
-(void)printThreeMonth:(int)start andYear:(int) year{
    NSArray *dayArray = [NSArray arrayWithObjects:@" 1 ",@" 2 ",@" 3 ",@" 4 ",@" 5 ",@" 6 ",@" 7 ",@" 8 ",@" 9 ",@"10 ",@"11 ",@"12 ",@"13 ",@"14 ",@"15 ",@"16 ",@"17 ",@"18 ",@"19 ",@"20 ",@"21 ", @"22 ",@"23 ",@"24 ",@"25 ", @"26 ",@"27 ",@"28 ", @"29 ",@"30 ",@"31 ",nil];
    
    
    NSArray *daysInMonth ;
    
    if ( [self isLeapYear:year] ){
        daysInMonth = [NSArray arrayWithObjects:@"31",@"29",@"31", @"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31",nil];
    }
    else{
        daysInMonth = [NSArray arrayWithObjects:@"31",@"28",@"31", @"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31",nil];
    }
    
    int pos1,pos2,pos3;
    int days1,days2,days3 ;
    int index1,index2,index3 ;
    
    pos1 = [self getFirstDayInMonth:start andYear:year] ;
    pos2 = [self getFirstDayInMonth:(start+1) andYear:year] ;
    pos3 = [self getFirstDayInMonth:(start+2) andYear:year] ;
    
    
    days1 = [[daysInMonth objectAtIndex:(start-1)] intValue];
    days2 = [[daysInMonth objectAtIndex:(start+1-1)] intValue];
    days3 = [[daysInMonth objectAtIndex:(start+2-1)] intValue];
    
    index1 = 0 ;
    index2 = 0 ;
    index3 = 0 ;
    
    //分三次打印
    //第1行
    for(int i=0;i<pos1;i++)
        printf("   ");
    while (pos1!=7) {
        printf( "%s",[[dayArray objectAtIndex:index1] UTF8String]) ;
        pos1++;
        index1 ++ ;
    }
    printf("  ");
    for(int i=0;i<pos2;i++)
        printf("   ");
    while (pos2!=7) {
        printf( "%s",[[dayArray objectAtIndex:index2] UTF8String]) ;
        index2 ++ ;
        pos2++;
    }
    printf("  ");
    for(int i=0;i<pos3;i++)
        printf("   ");
    while (pos3!=7) {
        printf( "%s",[[dayArray objectAtIndex:index3] UTF8String]) ;
        index3 ++ ;
        pos3++ ;
    }
    //第234行
    printf("\n");
    for(int h=0;h<3;h++){
        for(int i=0;i<7;i++){
            printf( "%s",[[dayArray objectAtIndex:index1] UTF8String]) ;
            index1++;
        }
        printf("  ");
        for(int i=0;i<7;i++){
            printf( "%s",[[dayArray objectAtIndex:index2] UTF8String]) ;
            index2++;
        }
        printf("  ");
        for(int i=0;i<7;i++){
            printf( "%s",[[dayArray objectAtIndex:index3] UTF8String]) ;
            index3++;
        }
        printf("\n");
    }
    //第56行
    for(int m=0;m<2;m++){
        pos1 = 1;
        while(index1<days1 && pos1<=7){
            printf( "%s",[[dayArray objectAtIndex:index1] UTF8String]) ;
            pos1++ ;
            index1++ ;
        }
        for(int i=pos1;i<=7;i++)
            printf("   ");
        printf("  ");
        
        pos2 = 1;
        while(index2<days2 && pos2<=7){
            printf( "%s",[[dayArray objectAtIndex:index2] UTF8String]) ;
            pos2++ ;
            index2++ ;
        }
        for(int i=pos2;i<=7;i++)
            printf("   ");
        printf("  ");
        
        pos3 = 1;
        while(index3<days3 && pos3<=7){
            printf( "%s",[[dayArray objectAtIndex:index3] UTF8String]) ;
            pos3++ ;
            index3++ ;
        }
        for(int i=pos3;i<=7;i++)
            printf("   ");
        printf("  ");
        printf("\n");
    }

    
}
//打印本月
-(void) printNowMonth{
    //获取当前的年月
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth;
    NSDateComponents *d = [cal components:unitFlags fromDate:date];
    int year = (int) [d year] ;
    int month = (int) [d month];
    [self printMonth:month andYear:year];
}
//打印本年
-(void) printNowYear:(int)year{
    
    printf("                             %d\n\n",year);
    printf("        一月                 二月                三月\n");
    [self printWeek3];
    [self printThreeMonth:1 andYear:year];
    
    printf("        四月                 五月                六月\n");
    [self printWeek3];
    [self printThreeMonth:4 andYear:year];

    
    printf("        七月                 八月                九月\n");
    [self printWeek3];
    [self printThreeMonth:7 andYear:year];

    printf("        十月                十一月               十二月\n");
    [self printWeek3];
    [self printThreeMonth:10 andYear:year];
}
//打印指定的年月
-(void) printMonth:(int)month andYear:(int)year {
    
    NSArray *daysInMonth ;
    
    if ( [self isLeapYear:year] ){
        daysInMonth = [NSArray arrayWithObjects:@"31",@"29",@"31", @"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31",nil];
    }
    else{
        daysInMonth = [NSArray arrayWithObjects:@"31",@"28",@"31", @"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31",nil];
    }
    
    NSArray *monthArray = [NSArray arrayWithObjects:@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月", nil];
    NSArray *dayArray = [NSArray arrayWithObjects:@" 1 ",@" 2 ",@" 3 ",@" 4 ",@" 5 ",@" 6 ",@" 7 ",@" 8 ",@" 9 ",@"10 ",@"11 ",@"12 ",@"13 ",@"14 ",@"15 ",@"16 ",@"17 ",@"18 ",@"19 ",@"20 ",@"21 ", @"22 ",@"23 ",@"24 ",@"25 ", @"26 ",@"27 ",@"28 ", @"29 ",@"30 ",@"31 ",nil];
    
    //获取本月第一天是周几
    int position = [self getFirstDayInMonth:month andYear:year];
    //NSLog(@"%i",position);
    
    //开始打印string = [string1 stringByAppendingString:string2];
    NSString *stringYear = [@"  " stringByAppendingString:[NSString stringWithFormat:@"%d",year] ];
    
    NSString * title ;
    if(month<=10)
        title = [@"    " stringByAppendingString:[[monthArray objectAtIndex:(month-1)] stringByAppendingString:stringYear] ];
    else
        title = [@"   " stringByAppendingString:[[monthArray objectAtIndex:(month-1)] stringByAppendingString:stringYear] ];
    NSLog(@"%@",title);
    [self printWeek] ;
    for(int i=0;i<position;i++){
        printf("   ");
    }
    int days = [[daysInMonth objectAtIndex:(month-1)] intValue];
    for(int i=0;i<days;i++){
        if(position==7){
            printf("\n") ;
            position = 0; 
        }
        printf( "%s",[[dayArray objectAtIndex:i] UTF8String]);
        position++ ;
    }
}

@end