//
//  TableView.h
//  TodoList
//
//  Created by 曦 on 16/10/23.
//  Copyright © 2016年 cwz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableView : UITableView <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic) NSMutableArray *data;
@end
