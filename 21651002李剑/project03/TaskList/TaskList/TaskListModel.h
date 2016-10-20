//
//  TaskListModel.h
//  TaskList
//
//  Created by 李剑 on 16/10/18.
//  Copyright © 2016年 mutouren. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ListModel <NSObject>

- (NSInteger)count;
- (id)objectAtIndex:(NSInteger)index;
- (void)insertObject:(id)object AtIndex:(NSInteger)index;
- (void)removeObjectAtIndex:(NSInteger)index;

@end

@interface TaskListModel : NSObject <ListModel>

//- (instancetype)initWithArray:(NSArray *)array;
- (void)saveTaskList;
- (void)loadTaskList;

@end
