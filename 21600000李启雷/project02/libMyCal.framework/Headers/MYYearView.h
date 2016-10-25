//
//  MYYearView.h
//  myCal
//
//  Created by liqilei on 2016/10/6.
//  Copyright © 2016年 liqilei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MYViewBuffer;

@interface MYYearView : NSObject

@property NSInteger year;
@property (strong) MYViewBuffer* viewBuffer;

- (instancetype) initWithYear: (NSInteger) year;

@end
