//
//  TDTaskHeader.h
//  ToDoList
//
//  Created by soulghost on 24/10/2016.
//  Copyright © 2016 soulghost. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TDTaskHeaderCallback)(NSString *content);


@interface TDTaskHeader : UIView

+ (instancetype)header;
- (void)setOnClickCallback:(TDTaskHeaderCallback)callback;

@end
