//
//  Task.h
//  TaskList
//
//  Created by soulghost on 17/10/2016.
//  Copyright © 2016 jyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject <NSCoding>

@property (nonatomic, copy) NSString *taskTitle;

@end
