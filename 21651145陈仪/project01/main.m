//
//  main.m
//  CalPrint
//
//  Created by iOSChenYi on 16-10-1.
//  Copyright (c) 2016年 ChenYi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalMonth.h"
#import "CalYear.h"

//定义不会输出时间戳的NSLog函数。
#define NSLog(FORMAT, ...) fprintf(stdout, "%s", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

//将month、year转换成int类型的值。
//根据系统cal，以数字开头的参数，都会成功转换。比如“2016”转为2016，“2m16”则转为2。
//不以数字开头的，则转换失败，返回0。
int toInt(NSString *str)
{
    NSScanner *scan=[NSScanner scannerWithString:str];
    int value;
    
    //这里不能用&&，否则会产生不一样的结果：必须是纯数字。
    if ([scan scanInt:&value] || [scan isAtEnd]) {
        return value;
    }
    return 0;
}

//处理命令。包括：
//cal ［［month］ year］
//cal [-y] year
//cal -m month
//cal -j month  ——这条命令并不符合系统cal的格式，只是类似输出功能。
void processCommand(NSArray *comps)
{
    id obj;//CalMonth或者CalYear类型。
    
    if ([comps count]==1)//命令为cal
    {
        obj=[[CalMonth alloc] init];
        
    } else if ([comps count]==2)//命令为cal year
    {
        int year=toInt([comps objectAtIndex:1]);
        if (year==0 || year>9999) {
            NSLog(@"cal: year %d not in range 1..9999", year);
            return;
        }
        obj=[[CalYear alloc] initWithYear:year];
        
    }else if ([comps count]==3)
    {
        if ([[comps objectAtIndex:1]
             isEqualToString:@"-m"])//命令为cal －m month
        {
            int month=[[comps objectAtIndex:2] intValue];
            obj=[[CalMonth alloc] initWithMonth:month withJFlag:false];
            
        } else if ([[comps objectAtIndex:1]
                    isEqualToString:@"-y"])//命令为cal －y year
        {
            int year=[[comps objectAtIndex:2] intValue];
            obj=[[CalYear alloc] initWithYear:year];
            
        }else if ([[comps objectAtIndex:1]
                   isEqualToString:@"-j"])//命令为cal －j month
        {
            int month=[[comps objectAtIndex:2] intValue];
            
            obj=[[CalMonth alloc] initWithMonth:month withJFlag:true];
            
        } else//命令为cal month year
        {
            int year=toInt([comps objectAtIndex:2]);
            if (year==0 || year>9999) {
                NSLog(@"cal: year %d not in range 1..9999", year);
                return;
            }
            int month=toInt([comps objectAtIndex:1]);
            if (month<1 || month>12) {
                NSLog(@"cal: %@ is neither a month number (1..12) nor a name", [comps objectAtIndex:1]);
                return;
            }
            obj=[[CalMonth alloc] initWithYear:year andMonth:month];
        }
    }else
    {
        NSLog(@"Too much arguments\n");
        return;
    }
    
    NSLog(@"%@", [obj toString]);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        if (argc>3) {
            NSLog(@"usage: cal [[month] year]\n");
            return -1;
        }
        //将argv所有元素存到这个对象中。
        NSMutableArray *arguments=[[NSMutableArray alloc] init];
        
        for (int i=0; i<argc; ++i) {
            [arguments addObject:[NSString stringWithUTF8String:argv[i]]];
        }
        processCommand(arguments);
    }
    return 0;
}
