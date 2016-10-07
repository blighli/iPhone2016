//
//  CalendarRepresent.h
//  Cal
//
//  Created by 郭志强 on 16/9/29.
//  Copyright © 2016年 Armas. All rights reserved.
//

#import <Foundation/Foundation.h>
//#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#else
//#define NSLog(...)
//#endif

@interface CalendarRepresent : NSObject

+(NSArray*) printMonth:(int) year month:(int) m daysOfMonth:(int) length;

-(void) printWholeYear:(int) year;

+(NSDateComponents*) customComponents:(int) year month:(int) m;
@end
