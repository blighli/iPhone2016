//
//  AppDelegate.h
//  calendar
//
//  Created by lxy on 16/10/8.
//  Copyright © 2016年 lxy. All rights reserved.
//
#import <Foundation/Foundation.h>
@interface Month: NSObject

- (void) calMonth:(NSInteger) month AndYear:(NSInteger) year AndDay:(NSInteger) day ;
- (void) calYear:(NSInteger) year;

- (void) calMonthYear:(NSInteger) month AndYear:(NSInteger) year;

@end
