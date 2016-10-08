//
//  MonthPrintManager.m
//  cal
//
//  Created by yin on 16/10/1.
//  Copyright © 2016年 yin. All rights reserved.
//

#import "MonthPrintManager.h"

@implementation MonthPrintManager {
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _months = [[NSMutableArray alloc] initWithCapacity:12];
        _numOfOneLine = 3;
        _maxNum = 42;
    }
    return self;
}

- (void)addMonth:(Month *)month {
    [_months addObject:month];
}

- (void) print {
    //居中打印年标题 （ 总字符数为：maxCol*(7*2＋6＊1)＋ (maxCol－1)*2 )
    if (_title != nil && ![_title  isEqual: @""]) {
        // 当总月份数小于_numOfOneLine时，居中显示不一样
        int maxCol = [_months count] > _numOfOneLine ? _numOfOneLine : (int)[_months count];
        int pos = maxCol*10 + (maxCol-1) - [self calcLenOfCNString: _title]/2 - 1;
        [self printSpace: pos];
        printf("%s\n\n", [_title UTF8String]);
    }
    
    
    for (int i = 0; i < [_months count]; i += _numOfOneLine) {  // 月份行数 （比如12个月，没行打3个月，那么月份行数为4）
        // 每行月份打印的 月数（最大月份行数时有可能比_numOfOneLine小）
        int col = [_months count]-i > _numOfOneLine ? _numOfOneLine : (int)[_months count]-i;
        
        // 居中打印月份标题 (总字符数为 7*2＋6＊1)
        for (int k = 0; k < col; k++) {
            Month* month = _months[i+k];
            int len = [self calcLenOfCNString: month.title];
            int left = 10-(len+1)/2;
            int right = 20 - len - left;
            [self printSpace:left];
            printf("%s", [month.title UTF8String]);
            k+1 < col ? [self printSpace:right+2] : printf("\n");
        }
        // 打印 “日 一 二 三 四 五 六”
        for (int k = 0; k < col; k++) {
            printf("日 一 二 三 四 五 六");
            k+1 < col ? printf("  ") : printf("\n");
        }
        
        for (int r = 0; r < 6; r++) {  //每行月份 要打印六行
            for (int k = 0; k < col; k++) { // 每行月份打印的 月数（有可能比_numOfOneLine小）
                Month* month = _months[i+k];
                for (int n = 1; n <= 7; n++) { // 打印周日到周六 总共7天
                    if (r*7 + n >= month.start && r*7 + n <= month.end) {
                        printf("%2d", r*7 + n - month.start + 1);
                    }
                    else if ((r*7 + n > month.end) && n == 1 && k+1 >= col){
                        break;
                    }
                    else {
                        printf("  ");
                    }
                    if (n != 7) {
                        if (r*7 + n +1 > month.end && k+1 >= col) {
                            break;
                        }else {
                            printf(" ");
                        }
                    }
                }
                k+1 < col ? printf("  ") : printf("\n");
            }
        }
    }
}

- (int)calcLenOfCNString:(NSString *)str {
    int cnNum = 0;
    for(int i = 0; i < [str length]; i++){
        int a = [str characterAtIndex: i];
        if( a >= 0x4e00 && a <= 0x9fff)
            cnNum++;
    }
    int len = (int)[str length] + cnNum;
    return len;
}

- (void)printSpace:(int)num {
    for (int i = 0; i < num; i ++) {
        printf(" ");
    }
}

@end
