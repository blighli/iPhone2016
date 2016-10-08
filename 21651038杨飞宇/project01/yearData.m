//
//  yearData.m
//  MyCal
//
//  Created by yangfeiyu on 16/10/6.
//  Copyright © 2016年 yangfeiyu. All rights reserved.
//

#import "yearData.h"

@implementation yearData
-(void)setYearData:(int)year{
    m_year = year;
    yearMonth = [NSMutableArray arrayWithCapacity:12];
        for (int i = 1; i <= 12; i++) {
        monthData *monthTmp = [[monthData alloc]init];

        [monthTmp setMonthData:year :i];
            
        [yearMonth addObject:monthTmp];
    }
}

-(void)printYearData{
    [self setEveryDay];
    printf("                              %d\n",m_year);
    printf("\n");
    
    for (int h = 0 ; h < 24; h++) {
        if(h == 0){
            printf("         Jan                   Feb                   Mar        \n");
            printf("Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n");
        }else if (h == 6){
            printf("         Apr                   May                   Jun        \n");
            printf("Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n");
        }else if (h == 12){
            printf("         Jul                   Aug                   Sep        \n");
            printf("Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n");
        }else if (h == 18){
            printf("         Oct                   Nov                   Dec        \n");
            printf("Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n");
        }
        
        for (int k = 0; k < 21; k++) {
            if(k == 7 || k == 14){
                printf(" ");
            }
            if(m_day[h][k] == 0){
                printf("   ");
            }else{
        
                if(m_day[h][k] < 10){
                    printf(" %d ",m_day[h][k]);
                }else{
                    printf("%d ",m_day[h][k]);
                }
            }
            //printf("%d ",m_day[h][k]);
        }
        printf("\n");
    }
    
    
}

-(void) setEveryDay{
    int count = 0;
    for (monthData* monthTmp in yearMonth) {
        //NSLog(@"%@",monthTmp->yearAndMonth);
        int i = (count / 3) * 6;
        int j = (count % 3) * 7;
        //printf("%d---%d\n",i,j);
        count++;
        
        for (int h = 0 ; h < 6; h++) {
            for (int k = 0; k < 7; k++) {
                m_day[i+h][j+k] = monthTmp->day[h][k];
            }
        }
        
    }
    
//    for (int h = 0 ; h < 23; h++) {
//        for (int k = 0; k < 21; k++) {
//            
//            printf("%d ",m_day[h][k]);
//        }
//        printf("\n");
//    }
    
    
}

@end
