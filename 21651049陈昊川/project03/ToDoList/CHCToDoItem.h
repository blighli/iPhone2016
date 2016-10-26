//
//  CHCToDoItem.h
//  ToDoList
//
//  Created by Nick Alan on 10/26/16.
//  Copyright © 2016 Nick Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHCToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly)NSDate *creationDate;

@end
