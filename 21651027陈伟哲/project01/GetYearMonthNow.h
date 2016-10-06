//
//  GetYearMonthNow.h
//  Cal
//
//  Created by cwz on 16/10/4.
//  Copyright © 2016年 cwz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetYearMonthNow : NSObject

@property(nonatomic) int year;
@property(nonatomic) int month;

-(void) yearMonth;
-(BOOL) judgeNumberRegex:(NSString*)str;

@end
