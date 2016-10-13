//
//  CalYear.m
//  CalPrint
//
//  Created by iOSChenYi on 16-10-3.
//  Copyright (c) 2016年 ChenYi. All rights reserved.
//

#import "CalYear.h"
#import "CalMonth.h"

@implementation CalYear

- (id) initWithYear:(NSUInteger)year
{
    self=[super init];
    if(self){
        [self setYear:year];
        
        [self setMonths:[[NSMutableArray alloc] init]];
        for(int i=1; i<=12; ++i)
        {
            CalMonth *month=[[CalMonth alloc] initWithYear:[self year]
                                                  andMonth:i];
            [[self months] addObject:month];
        }
    }
    return self;
}

- (NSString *) toString
{
    NSMutableString *output=[NSMutableString stringWithFormat:@""];
    //设置第一行年份前面的空格。因为老师说测试都是在1972－9999，这里就不用分情况了。
    [output appendFormat:@"                             %lu\n\n", [self year]];
    
    NSArray *monthHeader=
  @[@"        一月                  二月                  三月",
    @"        四月                  五月                  六月",
    @"        七月                  八月                  九月",
    @"        十月                 十一月                十二月"];
    //三个月一行
    NSString *weekHeader=@"日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六";
    
    //一次循环输出三个月
    for (int i=0; i<4; ++i) {
        [output appendFormat:@"%@\n", [monthHeader objectAtIndex:i]];
        [output appendFormat:@"%@\n", weekHeader];
        [output appendString:[self combineThreeMonth:
                              [[self months] objectAtIndex:i*3] :
                              [[self months] objectAtIndex:i*3+1] :
                              [[self months] objectAtIndex:i*3+2]]];
    }
    return output;
}

//将三个月的六行输出合并到一起。
-(NSString *) combineThreeMonth:(CalMonth*)month1 :(CalMonth*)month2 :(CalMonth*)month3
{
     NSMutableString *output=[NSMutableString stringWithFormat:@""];
    for (int i=0; i<6; ++i)
    {
        //第一个月和第二个月的处理是一样的，但是和第三个月不一样。
        [self processMonth:[month1 lines] withSrc:output ofLine:i];
        [self processMonth:[month2 lines] withSrc:output ofLine:i];
        
        //保证第六行的正确输出。
        if (i<[[month3 lines] count]) {
            [output appendString:[[month3 lines] objectAtIndex:i]];
        } else {
            [output appendString:@"\n"];
        }
    }
    return output;
}

- (void) processMonth:(NSMutableArray*)lines withSrc:(NSMutableString*)output ofLine:(int)i
{
    //i表示第几行。保证第六行的正确输出。
    if (i<[lines count]) {
        [output appendString:[lines objectAtIndex:i]];
        
        //和下一个月之间要有空格隔开。
        [output replaceCharactersInRange:NSMakeRange([output length]-1, 1) withString:@"  "];
        
        if (i==[lines count]-1) {
            //为了后一个月的排版，补足最后一行（第五行或者第六行）后面所需空格。
            [self spacesAfter:[[lines objectAtIndex:i] length]-1 withSrc:output];
        }
    } else {
        //若这个月没有第六行，为了后一个月的排版，要输出这一串空格。
        [output appendString:@"                      "];
    }
}

- (void) spacesAfter:(NSUInteger)num withSrc:(NSMutableString*)output
{
    //每一行20个字符。
    for (int i=0; i<20-num; ++i)
    {
        [output appendString:@" "];
    }
}
@end
