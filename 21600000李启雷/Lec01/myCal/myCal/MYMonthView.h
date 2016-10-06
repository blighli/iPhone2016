//
//  MYMonthView.h
//  myCal
//
//  Created by liqilei on 2016/10/6.
//  Copyright © 2016年 liqilei. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    MYMonthViewWidth = 20,
    MYMonthViewHeight = 8
};

@class MYViewBuffer;

@interface MYMonthView : NSObject

@property NSInteger year;
@property NSInteger month;
@property Boolean standAlone;
@property (strong) MYViewBuffer* viewBuffer;

+ (NSArray*) monthNames;
- (instancetype)initWithMonth:(NSInteger)month andYear:(NSInteger)year andStandAlone:(Boolean)standAlone;

@end
