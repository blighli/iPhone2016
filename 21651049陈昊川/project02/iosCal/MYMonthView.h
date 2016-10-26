//
//  MYMonthView.h
//  MyCal
//
//  Created by Nick Alan on 10/23/16.
//  Copyright © 2016 Nick Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

enum{
    MYMonthViewWidth = 20,
    MYMonthViewHeight = 8
};

@class MyViewBuffer;

@interface MYMonthView : NSObject

@property NSInteger year;
@property NSInteger month;
@property Boolean standAlone;
@property (strong) MyViewBuffer *viewBuffer;

+(NSArray*)monthNames;
-(instancetype)initWithMonth:(NSInteger)month andYear:(NSInteger)year andStandAlone:(Boolean)standAlone;

@end
