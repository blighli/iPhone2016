//
//  TDTask.m
//  ToDoList
//
//  Created by soulghost on 24/10/2016.
//  Copyright © 2016 soulghost. All rights reserved.
//

#import "TDTask.h"

NSString * const kTitle = @"kTDTaskTitle";

@implementation TDTask

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
