//
//  ViewController.h
//  taskList
//
//  Created by yangfeiyu on 2016/10/26.
//  Copyright © 2016年 yangfeiyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource>
{
    UITableView* _tableView;
    NSMutableArray* _arrayData;
    UITextField* _taskField;
    UIButton* _insertButton;
}

-(void) createMyView;
-(NSArray*) getFileContent;

@end

