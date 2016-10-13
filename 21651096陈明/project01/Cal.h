//
//  Cal.h
//  Project1
//
//  Created by chenming on 16/10/7.
//  Copyright © 2016年 chenming. All rights reserved.
//


#import <Foundation/Foundation.h>
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
@interface Cal : NSObject ;


-(void) printNowMonth ;   //"Cal"
-(void) printNowYear:(int)year ;  //"Cal 2016"
-(void) printMonth:(int)month andYear:(int)year; //"Cal 10 2016"

@end

