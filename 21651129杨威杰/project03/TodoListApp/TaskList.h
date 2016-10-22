//
//  TaskList.h
//  TodoListApp
//
//  Created by yangwj on 20/10/2016.
//  Copyright © 2016 yangwj. All rights reserved.
//

#ifndef TaskList_h
#define TaskList_h


typedef NSString Task;
typedef NSInteger TaskIndex;

@interface TaskList : NSObject

-(Boolean)addTask:(Task *)mTask;

-(Boolean)deleteTaskWithIndex:(TaskIndex)mTaskIndex;

-(void)saveTasks;

-(void)initTasks;

-(NSInteger)size;

-(Task *)getTaskAtIndex:(NSInteger)index;

@end
#endif /* TaskList_h */
