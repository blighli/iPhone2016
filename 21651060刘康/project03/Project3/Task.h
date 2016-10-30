//
//  Task.h
//  Project3
//
//  Created by Edward Lin on 2016/10/24.
//  Copyright © 2016年 Edward Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject <NSCoding>

@property (copy, nonatomic) NSString *taskName;

+ (NSString *)docPath;

@end
