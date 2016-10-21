//
//  calView.m
//  calApp
//
//  Created by yangfeiyu on 2016/10/21.
//  Copyright © 2016年 yangfeiyu. All rights reserved.
//


#import "calView.h"
#import "monthData.h"

@implementation calView

- (void) drawRect:(CGRect)rect{
    monthData *mData = [[monthData alloc] init];
    [mData initData];
    UIFont *font = [UIFont systemFontOfSize:15 weight:14];
    NSDictionary* attributes = @{NSFontAttributeName : font};
    NSString *daystr = [[NSString alloc] init];
    CGSize spaceSize = [@"    " sizeWithAttributes:attributes];
    CGPoint start = CGPointMake(55, 130);
    CGPoint cgp = start;
    NSString *title = @"                2016         10";
    [title drawAtPoint:cgp withAttributes:attributes];
    cgp.y += spaceSize.height;
    [daystr drawAtPoint:cgp withAttributes:attributes];
    NSString *week = @"SU  MO  TU  WE  TH  FR  SA";
    [week drawAtPoint:cgp withAttributes:attributes];
    cgp.y += spaceSize.height;

    for(int i = 0; i < 6; i++)
    {
        for(int j = 0; j < 7; j++)
        {
            if(mData->day[i][j] != 0)
            {
                if(mData->day[i][j] < 10){
                    daystr = [NSString stringWithFormat:@"%d",mData->day[i][j]];
                    cgp.x += 7;
                    [daystr drawAtPoint:cgp withAttributes:attributes];
                    cgp.x += 23;
                    continue;
                }else{
                    daystr = [NSString stringWithFormat:@"%d",mData->day[i][j]];
                }
                
            }
            else
            {
                daystr = @"";
            }
            [daystr drawAtPoint:cgp withAttributes:attributes];
            cgp.x += 30;
            
        }
        cgp.x = start.x;
        cgp.y += spaceSize.height;


    }
}


@end




