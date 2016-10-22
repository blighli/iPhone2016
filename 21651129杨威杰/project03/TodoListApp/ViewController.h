//
//  ViewController.h
//  TodoListApp
//
//  Created by yangwj on 16/10/18.
//  Copyright © 2016年 yangwj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *mUITextField;
@property (weak, nonatomic) IBOutlet UITableView *mUITableView;


@end

