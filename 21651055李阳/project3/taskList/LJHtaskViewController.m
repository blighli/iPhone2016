//
//  LJHtaskViewController.m
//  taskList
//
//  Created by 李阳 on 2016/10/22.
//  Copyright © 2016年 李阳. All rights reserved.
//

#import "LJHtaskViewController.h"
#import "LJHtaskTableViewCell.h"
//#import "SVProgressHUD/SVProgressHUD.h"
@interface LJHtaskViewController ()<UITableViewDataSource,LJHtaskTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *taskTableView;
@property (weak, nonatomic) IBOutlet UITextField *taskTextField;
@property (copy, nonatomic) NSArray *taskArray;//待办任务
@property (copy, nonatomic) NSString *tasksPlistPath;

@end

@implementation LJHtaskViewController

#pragma mark - buttonEvent
- (IBAction)addTask:(id)sender {
    //把任务添加到数组中，并且刷新tableView
    //NSArray *array = [NSArray array];
    if (![_taskTextField.text isEqualToString:@""]) {
        //可以添加到数组中，但要保证是不同的任务
        if (![_taskArray containsObject:_taskTextField.text]) {
            _taskArray = [_taskArray arrayByAddingObject:_taskTextField.text];
            [_taskArray writeToFile:_tasksPlistPath atomically:YES];
            [_taskTableView reloadData];
        }
    }
}
//- (IBAction)testSVProgressHUD:(id)sender {
//    [SVProgressHUD showErrorWithStatus:@"wrong"];
//}
#pragma mark - View
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //在这里读取待办任务
    self.tasksPlistPath = [LJHtaskViewController createTasksPlist];//已经创建了任务清单
    NSArray *tasksArray = [[NSArray alloc]initWithContentsOfFile:_tasksPlistPath];
    self.taskArray = tasksArray;
    self.taskTableView.dataSource = self;
}
//收起键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES]; //实现该方法是需要注意view需要是继承UIControl而来的
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    //可以按照日期来分组，这里暂分1组
    return 1;
}
//有几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%lu",(unsigned long)self.taskArray.count);
    return self.taskArray.count;
}
//每一行的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //定义标记
    static NSString *cellIdentifier = @"cell";
    //从缓冲池中取出cell
    LJHtaskTableViewCell *cell = (LJHtaskTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //缓冲池中没有cell
    if(cell == nil){
        //从xib文件中加载出来
        cell = [[NSBundle mainBundle] loadNibNamed:@"LJHtaskTableViewCell" owner:nil options:nil][0];
        cell.delegate = self;
    }
    cell.taskLabel.text = self.taskArray[indexPath.row];
    return  cell;
}
#pragma mark - <LJHtaskTableViewCellDelegate>
- (void)finishedTaskTableViewCell:(LJHtaskTableViewCell *)cell{
    //在数组中移除任务
    NSString *finishedTask = cell.taskLabel.text;
    NSArray *newTasksArray = [NSArray array];
    for (int index = 0; index < _taskArray.count; index ++) {
        if (![_taskArray[index] isEqualToString:finishedTask]) {
            newTasksArray = [newTasksArray arrayByAddingObject:_taskArray[index]];
        }
    }
    _taskArray = newTasksArray;
    [_taskTableView reloadData];
}
#pragma mark - other
+ (NSString *)createTasksPlist{
    //获取caches文件路径
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    //获取完整路径
    NSString *cachesPath = [path objectAtIndex:0];
    NSString *tasksPlistPath = [cachesPath stringByAppendingPathExtension:@"tasks.plist"];
    return tasksPlistPath;
}

@end
