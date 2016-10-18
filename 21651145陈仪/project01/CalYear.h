//
//  CalYear.h
//  CalPrint
//
//  Created by iOSChenYi on 16-10-3.
//  Copyright (c) 2016年 ChenYi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CalMonth;

@interface CalYear : NSObject
@property NSInteger year;
//12个月都存在这里。
@property NSMutableArray *months;

- (id) initWithYear:(NSUInteger)year;
- (NSString *) toString;
- (NSString *) combineThreeMonth:(CalMonth*)month1 :(CalMonth*)month2 :(CalMonth*)month3;
- (void) processMonth:(NSMutableArray*)lines withSrc:(NSMutableString*)output ofLine:(int)i;
- (void) spacesAfter:(NSUInteger)num withSrc:(NSMutableString*)output;
@end
