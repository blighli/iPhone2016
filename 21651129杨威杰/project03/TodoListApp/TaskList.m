//
//  TaskList.m
//  TodoListApp
//
//  Created by yangwj on 20/10/2016.
//  Copyright © 2016 yangwj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskList.h"

@implementation TaskList

NSMutableArray * tasks;

-(Boolean)addTask:(Task *)mTask
{
    if([mTask isEqualToString:@""]){
        return FALSE;
    }
    [tasks addObject:mTask];
    return TRUE;
}

-(Boolean)deleteTaskWithIndex:(TaskIndex)mTaskIndex
{
    if(mTaskIndex < 0){
        return FALSE;
    }
    [tasks removeObjectAtIndex:mTaskIndex];
    return TRUE;
}

-(void)saveTasks
{
    [tasks writeToFile:[self TaskDataPath] atomically:YES];
}

-(void)initTasks
{
    NSArray * plist = [NSArray arrayWithContentsOfFile:[self TaskDataPath]];
    if(plist){
        tasks = [plist mutableCopy];
    }
    else{
        tasks = [[NSMutableArray alloc]init];
    }
}

-(NSInteger)size{
    return [tasks count];
}

-(Task *)getTaskAtIndex:(NSInteger)index{
    return [tasks objectAtIndex:index];
}

-(NSString *) TaskDataPath
{
    NSMutableString * TASK_DATA_FILE_PATH = [NSMutableString stringWithFormat:@"taskdata.txt"];
    NSArray * pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathList objectAtIndex:0] stringByAppendingPathComponent:TASK_DATA_FILE_PATH];
}

@end