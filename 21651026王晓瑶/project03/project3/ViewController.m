//
//  ViewController.m
//  toDoList
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSMutableArray *taskTable;
NSString *plistPath;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    plistPath = [[NSBundle mainBundle] pathForResource:@"TaskList" ofType:@"plist"];
    taskTable = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)insertTask:(id)sender {
    _taskInput.text = [_taskInput.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([_taskInput.text isEqualToString:@""]) {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"任务不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
        return;
    }
    [taskTable addObject:_taskInput.text];
    [taskTable writeToFile:plistPath atomically:YES];
    [_taskTableView reloadData];
    _taskInput.text = @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [taskTable count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.textLabel.text = [taskTable objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *taskSelectedStr = [taskTable objectAtIndex:[indexPath row]];
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"修改/删除任务";
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.delegate = self;
    [alert addButtonWithTitle:@"删除"];
    [alert addButtonWithTitle:@"修改"];
    [alert addButtonWithTitle:@"取消"];
    [alert textFieldAtIndex:0].text = taskSelectedStr;
    [alert show];
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"任务列表";
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            [taskTable removeObjectAtIndex:[[_taskTableView indexPathForSelectedRow] row]];
            [taskTable writeToFile:plistPath atomically:YES];
            [_taskTableView reloadData];
            break;
        case 1:
            [taskTable replaceObjectAtIndex:[[_taskTableView indexPathForSelectedRow] row] withObject:[alertView textFieldAtIndex:0].text];
            [taskTable writeToFile:plistPath atomically:YES];
            [_taskTableView reloadData];
            break;
    }
}

@end