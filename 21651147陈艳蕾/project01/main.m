//
//  main.m
//  CYLCalendar
//
//  Created by sara on 16/10/8.
//  Copyright © 2016年 sara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYLCal.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        CYLCal * myCal = [[CYLCal alloc]init];
        
        switch (argc) {
            case 1:
            {
                [myCal printThisMonth];
                break;
            }
            case 2:
            {
                int year = atoi(argv[1]);
                if (year>=1 && year <= 9999){
                    [myCal printByYear:year];
                }else {
                    printf("year %i not in range 1..9999\n",year);
                }
                break;
            }
            case 3:
            {
                
                int month = atoi(argv[1]);
                int year = atoi(argv[2]);
                if (month >= 1 && month <= 12 && year>=1 && year<=9999) {
                    [myCal printByMonth:month andYear:year];
                }else if(month <1 || month >12 ){
                    printf("month %i not in range 1..12\n",month);
                }else if(year <1 || year >9999){
                    printf("year %i not in range 1..9999\n",year);
                }else{
                    printf("invalid input.\n");
                }
                break;
            }
            default:
            {
                printf("invalid input.\n");
                break;
            }
        }

    }
    return 0;
}
