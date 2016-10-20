//
//  TaskListTableViewController.m
//  TaskList
//
//  Created by 李剑 on 16/10/18.
//  Copyright © 2016年 mutouren. All rights reserved.
//

#import "TaskListTableViewController.h"
//#import "TaskListModel.h"

@interface TaskListTableViewController () <UITextFieldDelegate, UIScrollViewDelegate>

@property (nonatomic) UITextField *taskTextField;//输入框
@property (nonatomic) UIBarButtonItem *insertBarItem;//添加任务按钮
@property (nonatomic) UIBarButtonItem *startEditingBarItem;//编辑cell按钮，可删除或移动cell
@property (nonatomic) UIBarButtonItem *endEditingBarItem;//结束编辑cell按钮

@property (nonatomic) UIButton *obscureButtonView;//在键盘外点击退出键盘



@end

static NSString * const CellIdentifier = @"TaskCellIdentifier";


@implementation TaskListTableViewController
{
	//UILongPressGestureRecognizer *longPressGestureRecognizer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self configureViews];
}

- (void)configureViews
{
	self.navigationItem.titleView = self.taskTextField;
	self.navigationItem.rightBarButtonItem = self.startEditingBarItem;
}

//- (void)configureGestures
//{
//	longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(startEditing)];
//	[self.tableView addGestureRecognizer:longPressGestureRecognizer];
//}

- (void)hideKeyBoard
{
	[self.taskTextField resignFirstResponder];
	if ([self.taskTextField.text isEqualToString:@""]) self.navigationItem.rightBarButtonItem = self.startEditingBarItem;
	//self.insertBarItem.enabled = NO;
	[UIView animateWithDuration:0.3 animations:^{
		self.obscureButtonView.alpha = 0;
		CGPointMake(self.view.bounds.size.width / 2, -self.view.bounds.size.height / 2);
	}completion:^(BOOL finished){
		self.obscureButtonView.hidden = YES;
	}];
}
//添加新的任务
- (void)addTask
{
	[self.taskList insertObject:self.taskTextField.text AtIndex:0];
	[self hideKeyBoard];
	self.insertBarItem.enabled = NO;
	self.taskTextField.text = @"";
	self.navigationItem.rightBarButtonItem = self.startEditingBarItem;
	
	[self.tableView reloadData];
}
//开始编辑cell，将编辑按钮换为结束按钮
- (void)startEditing
{
	NSLog(@"enterEditing");
	self.taskTextField.enabled = NO;
	[self.tableView setEditing:YES animated:YES];
	self.navigationItem.rightBarButtonItem = self.endEditingBarItem;
	
	//longPressGestureRecognizer.enabled = NO;
}
//结束编辑cell，退出tableview的编辑模式，将结束按钮换为编辑按钮
- (void)endEditing
{
	self.taskTextField.enabled = YES;
	self.navigationItem.rightBarButtonItem = self.startEditingBarItem;
	[self.tableView setEditing:NO animated:YES];
	//longPressGestureRecognizer.enabled = YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.taskList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
	cell.textLabel.text = (NSString *)[self.taskList objectAtIndex:indexPath.row];
	
	return cell;
}

//向左滑动，提供删除按钮
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		[self.taskList removeObjectAtIndex:indexPath.row];
		[self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}
	else if (editingStyle == UITableViewCellEditingStyleInsert)
	{
		[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
	}
}
//移动cell位置
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
	id object = [self.taskList objectAtIndex:sourceIndexPath.row];
	[self.taskList removeObjectAtIndex:sourceIndexPath.row];
	[self.taskList insertObject: object AtIndex: destinationIndexPath.row];
}


#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 60;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
}

//在一个cell从tableview中移除后，如果taskList为空，则disable编辑按钮
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if ([self.taskList count] == 0)
	{
		self.startEditingBarItem.enabled = NO;
	}
}
//在一个cell将要被展示时，若taskList不为空，则enable编辑按钮
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if ([self.taskList count] != 0)
	{
		self.startEditingBarItem.enabled = YES;
	}
}

#pragma UIScrollViewDelegate

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//	[self hideKeyBoard];
//}

#pragma mark - UITextFieldDelegate
//用户输入文字时，将编辑按钮换为添加按钮
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	self.navigationItem.rightBarButtonItem = self.insertBarItem;
}
//监听textField的变化，没有文字就disable添加按钮，有文字就enable添加按钮
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	//NSLog(@"shouldChangeCharactersInRange");
//	NSLog(@"textField.text: %@", textField.text);
//	NSLog(@"string: %@", string);
	NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
	//NSLog(@"new string: %@", newString);
	if (![newString isEqual: @""]) self.insertBarItem.enabled = YES;
	else self.insertBarItem.enabled = NO;
	
	return YES;
}
//用户点击textField内嵌的清除按钮
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
	//NSLog(@"textFieldShouldClear");
	textField.text = @"";
	self.insertBarItem.enabled = NO;
	
	return NO;;
}
//键盘弹出时，一起弹出obscureButtonView，点击obscureButtonView可以退出编辑，隐藏键盘
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
	self.obscureButtonView.hidden = NO;
	[UIView animateWithDuration:0.3 animations:^{
		self.obscureButtonView.alpha = 0.5;
		self.obscureButtonView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
	}completion:nil];
	
	return YES;
}

#pragma mark - Accessor methods

- (UITextField *)taskTextField
{
	if (_taskTextField == nil)
	{
		_taskTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * 3.0 / 4, 30)];
		_taskTextField.backgroundColor = [UIColor whiteColor];
		_taskTextField.placeholder = @"Type in a new task here";
		_taskTextField.autoresizingMask = UIViewAutoresizingNone;
		_taskTextField.borderStyle = UITextBorderStyleRoundedRect;
		_taskTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
		
		_taskTextField.delegate = self;
	}
	
	return _taskTextField;
}

- (UIBarButtonItem *)insertBarItem
{
	if (_insertBarItem == nil)
	{
		_insertBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTask)];
		_insertBarItem.enabled = NO;
	}
	
	return _insertBarItem;
}

- (UIBarButtonItem *)startEditingBarItem
{
	if (_startEditingBarItem == nil)
	{
		_startEditingBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(startEditing)];
		if ([self.taskList count] == 0) _startEditingBarItem.enabled = NO;
	}
	
	return _startEditingBarItem;
}

- (UIBarButtonItem *)endEditingBarItem
{
	if (_endEditingBarItem == nil)
	{
		_endEditingBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(endEditing)];
	}
	
	return _endEditingBarItem;
}

- (UIButton *)obscureButtonView
{
	if (_obscureButtonView == nil)
	{
		_obscureButtonView = [[UIButton alloc] initWithFrame:self.view.bounds];
		_obscureButtonView.backgroundColor = [UIColor blackColor];
		_obscureButtonView.alpha = 0;
		_obscureButtonView.hidden = YES;
		[_obscureButtonView addTarget:self action:@selector(hideKeyBoard) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:_obscureButtonView];
		_obscureButtonView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height);
	}
	
	return _obscureButtonView;
}

- (id<ListModel>)taskList
{
	if (_taskList == nil)
	{
		_taskList = [[TaskListModel alloc] init];
	}
	return _taskList;
}



@end
