//
//  ViewController.m
//  SLTaskList
//
//  Created by SuperleeOS on 16/10/26.
//  Copyright © 2016年 SuperleeOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource> {
    NSString *_reuseID;  //标志装在task内容的cell
    NSString *_filePath; //任务文件存储路径
}



@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic, strong) NSMutableArray<NSString *> *taskList;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _reuseID = @"TaskCell";
    _filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"tasks"];
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:_reuseID];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSMutableArray *taskList = [NSKeyedUnarchiver unarchiveObjectWithFile:_filePath];
    if (!taskList) {
        taskList = @[].mutableCopy;
    }
    self.taskList = taskList;
}

- (IBAction)handleClick:(id)sender {
    NSString *content = self.textField.text;
    if (!content) return;
    [self.taskList addObject:content];
    [self.tableView reloadData];
    [NSKeyedArchiver archiveRootObject:self.taskList toFile:_filePath];
    self.textField.text = @"";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

// 返回多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.taskList.count;
}

// 返回task实际内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_reuseID];
    cell.textLabel.text = self.taskList[indexPath.row];
    return cell;
}


@end
