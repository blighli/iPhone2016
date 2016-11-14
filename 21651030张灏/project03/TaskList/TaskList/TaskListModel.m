//
//  TaskListModel.m
//  TaskList
//
//  Created by zhang on 16/11/1.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import "TaskListModel.h"

@interface TaskListModel()

@property (nonatomic) NSMutableArray *taskArray;

@end

static NSString * const StorageKey = @"TaskList";

@implementation TaskListModel


#pragma mark - ListModel Protocol
- (id)objectAtIndex:(NSInteger)index
{
	return self.taskArray[index];
}

- (void)insertObject:(id)object AtIndex:(NSInteger)index
{
	[self.taskArray insertObject:object atIndex:index];
}

- (void)removeObjectAtIndex:(NSInteger)index
{
	[self.taskArray removeObjectAtIndex:index];
}

#pragma mark - Accessor Methods
- (NSMutableArray *)taskArray
{
	if (_taskArray == nil)
	{
		_taskArray = [[NSMutableArray alloc] init];
	}
	
	return _taskArray;
}

- (NSInteger)count
{
	return self.taskArray.count;
}

# pragma mark - persistent storage
- (NSString *)dataFilePath
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	return [paths[0] stringByAppendingPathComponent:@"TaskList.plist"];
}

- (void)saveTaskList
{
	NSMutableData *data = [NSMutableData data];
	NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
	[archiver encodeObject:self.taskArray forKey:StorageKey];
	[archiver finishEncoding];
	[data writeToFile:[self dataFilePath] atomically:YES];
}

- (void)loadTaskList
{
	NSString *path = [self dataFilePath];
	if ([[NSFileManager defaultManager] fileExistsAtPath:path])
	{
		NSData *data = [NSData dataWithContentsOfFile:path];
		if (data != nil)
		{
			NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
			self.taskArray = [[NSMutableArray alloc] initWithArray:((NSArray *)[unarchiver decodeObjectForKey:StorageKey])];
			[unarchiver finishDecoding];
		}
	}
}

@end
