//
//  Show.h
//  CalLib
//
//  Created by Armas on 10/19/16.
//  Copyright © 2016 Armas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MYMonthView.h"
#import "MYYearView.h"
#import "MYViewBuffer.h"

@interface Show : NSObject
-(NSString*)selectMonth:(NSInteger)_month year:(NSInteger)_year;
-(NSString*)selectYear:(NSInteger)year;
@end
