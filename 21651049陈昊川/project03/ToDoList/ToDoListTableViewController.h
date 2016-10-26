//
//  ToDoListTableViewController.h
//  ToDoList
//
//  Created by Nick Alan on 10/26/16.
//  Copyright © 2016 Nick Alan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHCToDoItem.h"
typedef void  (^ReturnTextBlock)(CHCToDoItem *toDoItem);
@interface ToDoListTableViewController : UITableViewController
@property(nonatomic,copy) ReturnTextBlock returnTextBlock;
//-(void)returnText:(ReturnTextBlock)block;
@end
