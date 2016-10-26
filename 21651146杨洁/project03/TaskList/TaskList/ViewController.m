//
//  ViewController.m
//  TaskList
//
//  Created by soulghost on 17/10/2016.
//  Copyright © 2016 jyoung. All rights reserved.
//

#import "ViewController.h"
#import "TaskTableView.h"
#import "Task.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet TaskTableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (nonatomic, copy) NSString *filePath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"tasks.data"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSArray *tasks = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    if (tasks) {
        self.tableView.tasks = tasks.mutableCopy;
    } else {
        self.tableView.tasks = @[].mutableCopy;
    }
}

- (IBAction)addClick:(id)sender {
    NSString *content = self.inputField.text;
    if (!content) return;
    Task *t = [Task new];
    t.taskTitle = content;
    [self.tableView insertTask:t];
    [NSKeyedArchiver archiveRootObject:self.tableView.tasks toFile:self.filePath];
    self.inputField.text = @"";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
