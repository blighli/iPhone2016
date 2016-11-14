//
//  DayRange.m
//  cal
//
//  Created by zhang on 16/11/1.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import "Month.h"

@implementation Month

- (instancetype)initWithStart:(int) start end:(int) end title: (NSString*) title
{
    self = [super init];
    if (self) {
        _start = start;
        _end = end;
        _title = title;
    }
    return self;
}

+ (Month *)monthWithStart:(int)start end:(int)end title:(NSString*) title {
    return [[Month alloc] initWithStart:start end:end title: title];
}

@end
