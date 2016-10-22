//
//  ViewController.m
//  TodoListApp
//
//  Created by yangwj on 16/10/18.
//  Copyright © 2016年 yangwj. All rights reserved.
//

#import "ViewController.h"
#import "TaskList.h"

@interface ViewController ()
- (IBAction)buttonPressed:(UIButton *)sender;

@end

@implementation ViewController

TaskList * mTaskList;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 观察application的DidEnterBackgroundNotification事件
    UIApplication * app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:(@selector(saveData)) name:UIApplicationDidEnterBackgroundNotification object:app];
    
    mTaskList = [[TaskList alloc] init];
    [mTaskList initTasks];
    
    [_mUITableView setDataSource:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 用户点击Insert按钮
- (IBAction)buttonPressed:(UIButton *)sender {
    Task * inputContent = _mUITextField.text;
    
    Boolean addSuccessOrNot = [mTaskList addTask:inputContent];
    if(addSuccessOrNot){
        [_mUITableView reloadData];
        // 清除用户输入内容
        _mUITextField.text = @"";
        // 关闭软键盘
        [_mUITextField resignFirstResponder];
    }else{
        [self alert:@"the content of the to-do task cannot be none"];
    }
    
}

-(void)saveData{
    [mTaskList saveTasks];
}

//===============Embed View Part==========

// 弹出消息提示框
-(void)alert:(NSString *)message{
    UIAlertController * mUIAlertController = [UIAlertController alertControllerWithTitle:@"Info" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    [mUIAlertController addAction:defaultAction];
    [self presentViewController:mUIAlertController animated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id count = [NSNumber numberWithInteger:[mTaskList size]];
    SEL testNoData = @selector(tableViewDisplayWitMsg:ifNecessaryForRowCount:);
    if([self respondsToSelector:testNoData]){
        [self performSelector:testNoData withObject:@"No to-do tasks now..." withObject:count];
    }
    return [mTaskList size];
}

// 当tableView中不存在数据时，显示UILabel作为代替
- (void) tableViewDisplayWitMsg:(NSString *) message ifNecessaryForRowCount:(NSNumber *) rowCount
{
    NSNumber * zero = [NSNumber numberWithInteger:0];
    if ([rowCount isEqualToNumber:zero]) {
        UILabel *messageLabel = [UILabel new];
        
        messageLabel.text = message;
        messageLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        messageLabel.textColor = [UIColor lightGrayColor];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        [messageLabel sizeToFit];
        
        _mUITableView.backgroundView = messageLabel;
        _mUITableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    } else {
        _mUITableView.backgroundView = nil;
        _mUITableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [_mUITableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSString * item = [mTaskList getTaskAtIndex:[indexPath row]];
    [[cell textLabel] setText:item];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 右滑删除
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [mTaskList deleteTaskWithIndex:indexPath.row];
        [_mUITableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}
@end
