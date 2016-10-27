//
//  CYLToDoItem.h
//  CYLTODOList
//
//  Created by Sara on 16/10/26.
//  Copyright © 2016年 Sara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYLToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
