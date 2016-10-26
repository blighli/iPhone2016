//
//  ViewController.h
//  TaskList
//
//  Created by iOSChenYi on 16-10-18.
//  Copyright (c) 2016年 ChenYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

-(void)saveTaskList;
@end
