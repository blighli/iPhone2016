//
//  Task.m
//  TaskList
//
//  Created by soulghost on 17/10/2016.
//  Copyright © 2016 jyoung. All rights reserved.
//

#import "Task.h"

NSString * const kTitle = @"kTitle";

@implementation Task

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.taskTitle forKey:kTitle];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.taskTitle = [decoder decodeObjectForKey:kTitle];
    }
    return self;
}

@end
