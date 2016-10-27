//
//  ViewController.m
//  TaskList
//
//  Created by 李晓雯 on 2016/10/26.
//  Copyright © 2016年 li xiaowen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    UIButton *_addBtn;
    UITextField *_textField;
    NSMutableArray *_dataArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataArray = [NSMutableArray array];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 40, self.view.bounds.size.width - 20 - 50  - 10, 30)];
    _textField.layer.borderWidth = 0.5;
    _textField.layer.cornerRadius = 2;
    _textField.clipsToBounds = YES;
    _textField.placeholder = @"请输入";
    _textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:_textField];
    
    _addBtn = [[UIButton alloc] initWithFrame:CGRectMake(10 + _textField.bounds.size.width + 10, 40, 50, 30)];
    _addBtn.layer.cornerRadius = 2;
    _addBtn.clipsToBounds = YES;
    _addBtn.layer.borderWidth = 0.5;
    _addBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_addBtn setTitle:@"add" forState:UIControlStateNormal];
    [_addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:_addBtn];
    [_addBtn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, self.view.bounds.size.height -  80)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
}

- (void)btnClicked
{
    NSString *str  = _textField.text;
    if (![_textField.text isEqualToString:@""]) {
        [_dataArray addObject:str];
        [_tableView reloadData];
    }
    _textField.text = @"";
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
