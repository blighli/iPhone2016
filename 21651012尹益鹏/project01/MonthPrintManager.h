//
//  MonthPrintManager.h
//  cal
//
//  Created by yin on 16/10/1.
//  Copyright © 2016年 yin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Month.h"

@interface MonthPrintManager : NSObject {
NSMutableArray* _months;
    int _numOfOneLine; // 每行打印的 月数
    NSString* _title;
}
@property int numOfOneLine;
@property (copy) NSMutableArray* months;
@property (copy) NSString* title;
@property int maxNum;

- (void) addMonth: (Month*) month;

// 打印所有月份
- (void) print;

- (int) calcLenOfCNString: (NSString*) str;

- (void) printSpace: (int) num;
@end
