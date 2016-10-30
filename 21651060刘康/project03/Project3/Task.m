//
//  Task.m
//  Project3
//
//  Created by Newcon on 2016/10/24.
//

#import "Task.h"

@implementation Task

+ (NSString *)docPath {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [[pathArray objectAtIndex:0] stringByAppendingPathComponent:@"data.data"];
    NSLog(@"%@", docPath);
    return docPath;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.taskName forKey:@"task"];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.taskName = [decoder decodeObjectForKey:@"task"];
    }
    return self;
}

@end
