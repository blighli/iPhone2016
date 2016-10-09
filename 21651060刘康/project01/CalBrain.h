//
//  CalBrain.h
//  project01
//
//  Created by Newcon on 2016/10/8.
//  Copyright © 2016年 Newcon. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface CalBrain : NSObject

+ (void)runWithYear: (int)year;
+ (void)runWithYear: (int)year
              month: (int)month;
- (instancetype)initWithYear: (NSInteger)year
                       month: (NSInteger)month;

@end
