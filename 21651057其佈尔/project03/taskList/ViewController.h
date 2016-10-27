//
//  ViewController.h
//  taskList
//
//  Created by sally on 16/10/27.
//  Copyright © 2016年 sally. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)UITextField * taskField;
@property(nonatomic, strong)UIButton * insertButton;
@property(nonatomic, strong)UITableView * taskList;
@property(nonatomic, strong)NSMutableArray * taskListArray;

- (void)btnClick;

@end

