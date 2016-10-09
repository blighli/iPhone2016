//
//  AppDelegate.m
//  calendar
//
//  Created by lxy on 16/10/8.
//  Copyright © 2016年 lxy. All rights reserved.
//

#import "Month.h"

static NSInteger MonthDayNum[12]={
    31,29,31,30,31,30,31,31,30,31,30,31
};

static char* weekDay[] = {"Sun","Mon", "Tue", "Wed","Thu","Fri","Sat"};
static char* MonthDay[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};

@implementation Month

-(Boolean) isLeapYear:(NSInteger)year
//is leap year？
{
    if(((year%4==0) && (year%100!=0)) || (year%400==0)) {
        return true;
    } else {
        return false;
        //MonthDayNum[1]=28;
    }
}
- (void) calMonth:(NSInteger) month AndYear:(NSInteger) year AndDay:(NSInteger) day
{
    if([self isLeapYear: year]){
        MonthDayNum[1]=29;
    }
    else{
        MonthDayNum[1]=28;
    }
    printf("           %s  %4d\n",MonthDay[month-1], year,day);
    NSInteger Zcenter = year/100;
    NSInteger Zyear = year%100;
    NSInteger Zmonth=month;
    if(month==1) {Zmonth=13;Zyear=Zyear-1;}
    if(month==2) {Zmonth=14;Zyear=Zyear-1;}
    NSInteger Zday=1;
    NSInteger Zweek=0;
    Zweek=Zyear+(Zyear/4)+(Zcenter/4)-2*Zcenter+((26*(Zmonth+1))/10)+Zday-1;
    Zweek=Zweek%7;
    //NSLog(@"%d",Zweek);
    if(Zweek==0)Zweek=7;
   // printf(Zweek);
    if(Zweek<0)Zweek=Zweek+7;
    for (int j=0; j<7; ++j)
    {
        printf(" %s", weekDay[j]);
    }
    printf("\n");
    char c = ' ';
    int curDay = 1;
    while (curDay <= MonthDayNum[month-1])
    {
        
        if (curDay == 1) {
            if(Zweek!=7){
                for (int i=0; i<Zweek; ++i) printf("%4c", c);
            }
           
        }
        printf("%4d", curDay);
        
        if ((Zweek+curDay-1)%7 == 6) printf("\n");
        
        ++curDay;
    }
    
    printf("\n");
}
- (void) calYear:(NSInteger) year{
  for(int i=1;i<=12;i++){
    [self calMonth:i AndYear:year AndDay:1];
   }

}
- (void) calMonthYear:(NSInteger) month AndYear:(NSInteger) year{
     [self calMonth:month AndYear:year AndDay:1];
}

@end
