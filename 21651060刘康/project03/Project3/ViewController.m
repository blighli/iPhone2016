//
//  ViewController.m
//  Project3
//
//  Created by Newcon on 2016/10/24.
//

#import "ViewController.h"
#import "Task.h"
#import "TaskTableViewCell.h"
#import "GlobalData.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (strong, nonatomic) NSMutableArray<Task *> *taskArray;

@property (weak, nonatomic) IBOutlet UITextField *taskTextField;
@property (weak, nonatomic) IBOutlet UITableView *taskTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self loadTasksData];
}

- (void)loadTasksData {
    _taskArray = [NSMutableArray array];
    NSArray *tempArray = [NSArray array];
    tempArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[Task docPath]];
    if (tempArray != nil) {
        _taskArray = [tempArray mutableCopy];
    }
    [GlobalData sharedData].tasks = [NSArray array];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_taskArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskTableViewCell" forIndexPath:indexPath];
    cell.titleLabel.text = _taskArray[indexPath.row].taskName;
    return cell;
}

- (IBAction)insertButtonDidClicked:(id)sender {
    Task *newTask = [[Task alloc] init];
    newTask.taskName = _taskTextField.text;
    if ([newTask.taskName isEqualToString:@""]) {
        return;
    }
    [_taskArray addObject:newTask];
    [self.taskTableView reloadData];
    [self.taskTextField setText:@""];
    [self.taskTextField resignFirstResponder];
    [GlobalData sharedData].tasks = _taskArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
