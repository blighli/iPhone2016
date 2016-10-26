//
//  MYYearView.h
//  MyCal
//
//  Created by Nick Alan on 10/24/16.
//  Copyright © 2016 Nick Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MyViewBuffer;

@interface MYYearView : NSObject

@property NSInteger year;
@property(strong) MyViewBuffer *viewBuffer;

-(instancetype)initWithYear:(NSInteger)year;

@end
