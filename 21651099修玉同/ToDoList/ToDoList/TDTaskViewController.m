//
//  ToDoTableViewController.m
//  ToDoList
//
//  Created by soulghost on 24/10/2016.
//  Copyright © 2016 soulghost. All rights reserved.
//

#import "TDTaskViewController.h"
#import "TDTaskHeader.h"
#import "TDTaskCell.h"
#import "TDTask.h"

@interface TDTaskViewController ()

@property (nonatomic, strong) NSMutableArray<TDTask *> *tasks;
@property (nonatomic, strong) NSString *filePath;

@end

@implementation TDTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"tasks.data"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSMutableArray *tasks = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    if (!tasks) {
        tasks = @[].mutableCopy;
    }
    self.tasks = tasks;
}

- (void)updateData {
    [NSKeyedArchiver archiveRootObject:self.tasks toFile:self.filePath];
    [self.tableView reloadData];
}

#pragma mark - UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TDTaskHeader *header = [TDTaskHeader header];
    __weak typeof(self) weakSelf = self;
    [header setOnClickCallback:^(NSString *content) {
        TDTask *task = [TDTask new];
        task.taskTitle = content;
        [weakSelf.tasks addObject:task];
        [weakSelf updateData];
    }];
    return header;
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TDTaskCell *cell = [TDTaskCell cellWithTableView:tableView];
    cell.task = self.tasks[indexPath.row];
    return cell;
}

@end
