//
//  DayRange.h
//  cal
//
//  Created by zhang on 16/11/1.
//  Copyright © 2016年 zhang. All rights reserved.
//

/*
  每个月份打印的结果最多占六行
 
  日 一 二 三 四 五 六
   1  2  3  4  5  6  7
   8  9 10 11 12 13 14
  15 16 17 18 19 20 21
  22 23 24 25 26 27 28
  29 30 31 32 33 34 35
  36 37 38 39 40 41 42
 
 比如 _start = 7; _end = 37,表示月份：
 
  日 一 二 三 四 五 六
                    1
  2  3  4  5  6  7  8
  9 10 11 12 13 14 15
 16 17 18 19 20 21 22
 23 24 25 26 27 28 29
 30 31
 
*/
#import <Foundation/Foundation.h>

@interface Month : NSObject {
    int _start;
    int _end;
    NSString* _title;
}

@property int start;
@property int end;
@property (copy) NSString* title;

+ (Month*) monthWithStart: (int) start end: (int) end title: (NSString*) title;

- (id) initWithStart: (int) start end: (int) end title: (NSString*) title;

@end
