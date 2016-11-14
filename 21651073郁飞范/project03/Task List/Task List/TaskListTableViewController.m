//
//  TaskListTableViewController.m
//  Task List
//
//  Created by 郁飞范 on 16/10/16.
//  Copyright © 2016年 yufeifan. All rights reserved.
//

#import "TaskListTableViewController.h"

#define WidthRatio 0.52
#define HeightRatio 0.45

@interface TaskListTableViewController ()

@end

@implementation TaskListTableViewController
{
	sqlite3 *_database;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self initlizeDataBase];
	[self setDataSource];
	[self initializeTableView];
	[self addTapGesture];
}

- (void)initlizeDataBase
{
	//获取沙盒中的数据库文件名
	NSString *filename = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"taskList.sqlite"];
	//NSLog(@"%@",filename);
	
	
	//创建（打开数据库），如果数据库文件不存在，会自动创建
	int res = sqlite3_open(filename.UTF8String, &_database);
	if(SQLITE_OK == res)
	{
		//NSLog(@"打开数据库成功");
		//create a table
		char const *sql = "create table if not exists TABLE_task (id integer primary key autoincrement, task text);";
		char *errMsg = NULL;
		int result = sqlite3_exec(_database,sql, NULL, NULL, &errMsg);
		if(SQLITE_OK == result)
		{
			//NSLog(@"成功创建表taskList");
		}
		else
		{
			printf("%s\n",errMsg);
		}
	}
	else
	{
		NSLog(@"打开数据库失败");
	}
}

- (void)insertIntoDB:(NSString*)task
{
	NSString *insertSQL = [NSString stringWithFormat:@"insert into TABLE_task (task) values('%@');",task];
	char *errMsg = NULL;
	int result = sqlite3_exec(_database, insertSQL.UTF8String, NULL, NULL, &errMsg);
	if(result != SQLITE_OK)
	{
		printf("%s\n",errMsg);
	}
}

- (void)queryDB
{
	//char const *sql = "select * from TABLE_task;";
	//先取得编号，再取得内容
	char const *sql = "select id, task from TABLE_task;";
	
	//定义一个stmt存放结果集
	sqlite3_stmt *stmt = NULL;
	//检查SQL语句的合法性
	int res = sqlite3_prepare_v2(_database, sql, -1, &stmt,NULL);
	if(SQLITE_OK == res)
	{
		//NSLog(@"查询合法");
		//执行SQL语句
		//int stepRes = sqlite3_step(stmt);
		
		//查到一行数据
		while(SQLITE_ROW == sqlite3_step(stmt))
		{
			//获得对应这行数据
			//int idx = sqlite3_column_int(stmt, 0);
			unsigned char const *uctask = sqlite3_column_text(stmt,1);
			NSString *nstask = [NSString stringWithUTF8String:(char*)uctask];
			NSMutableString *task = [NSMutableString stringWithString:nstask];
			[self.taskList addObject:task];
		}
	}
}

- (void)setDataSource
{
	self.taskList = [[NSMutableArray alloc] init];
	[self.taskList addObject:@"practice programming"];
//	[self insertIntoDB:@"practice programming"];
	[self.taskList addObject:@"play the piano"];
//	[self insertIntoDB:@"play the piano"];
	[self.taskList addObject:@"read a book"];
//	[self insertIntoDB:@"read a book"];
	[self queryDB];
}

- (void)initializeTableView
{
	UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	self.tableView = tableView;
	self.tableView.delegate = self;
}
- (void)addTapGesture
{
	//解决tableView有textField时，点击tableView的空白界面，键盘不消失的问题
	UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hitTableViewToHideKeyboard)];
	tap.cancelsTouchesInView = NO;//默认为YES,设置为NO后，点击事件不会停止，就会传递下去
	[self.tableView addGestureRecognizer:tap];
}

- (void)insertTask
{
	if(![self.textField.text isEqualToString:@""])
	{
		NSInteger newIndex = [self.taskList count];
		[self.taskList addObject:self.textField.text];
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newIndex inSection:0];
		NSArray *indexpaths = @[indexPath];
		[self.tableView insertRowsAtIndexPaths:indexpaths withRowAnimation:UITableViewRowAnimationAutomatic];
		//插入到数据库中
		[self insertIntoDB:self.textField.text];
	}
}

- (void)hitTableViewToHideKeyboard
{
	[self.textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.taskList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *identifier = @"cell";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	
	if(nil == cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
	}

	cell.textLabel.backgroundColor = [UIColor clearColor];
	cell.textLabel.textColor  = [UIColor blackColor];
	cell.textLabel.text = [self.taskList objectAtIndex:indexPath.row];
	cell.textLabel.font = [UIFont systemFontOfSize:18 weight:20];
	cell.textLabel.textAlignment = NSTextAlignmentCenter;
	return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	//set tableHeaderView
	UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 70)];
	[header setBackgroundColor:[UIColor redColor]];
	
	[self initializeTextFieldAndInsertButton:header];
	
	return header;
}

- (void)initializeTextFieldAndInsertButton:(UIView*)header
{
	//set textfield
	CGFloat textW = WidthRatio * self.view.frame.size.width;
	CGFloat textH = HeightRatio * header.frame.size.height;
	CGFloat textX = (self.view.frame.size.width - textW) / 2;
	CGFloat textY = header.frame.size.height * 0.9 - textH;
	UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(textX, textY, textW, textH)];
	textField.backgroundColor = [UIColor whiteColor];
	self.textField = textField;
	self.textField.delegate = self;
	[header addSubview:textField];
	
	UIButton *insert = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	insert.frame = CGRectMake(textX+textW+5, 30, 100, textH);
	insert.backgroundColor = [UIColor clearColor];
	[insert setTitle:@"insert" forState:UIControlStateNormal];
	[insert setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	self.insertButton = insert;
	[self.insertButton addTarget:self action:@selector(insertTask) forControlEvents:UIControlEventTouchUpInside];
	[header addSubview:insert];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 70;//自定义高度
}

@end
