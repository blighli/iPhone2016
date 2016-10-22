//
//  ViewController.m
//  project03
//
//  Created by 缪为正 on 16-10-19.
//  Copyright (c) 2016年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *myText;
@property (weak, nonatomic) IBOutlet UITableView *mytable;

@end

@implementation ViewController
- (IBAction)addRow:(id)sender {
    NSString *text = [_myText text]; //从输⼊入框获取新的任务
    if ([text isEqualToString:@""]) {
        return; //如果是空的什么也不做
    }
    [_tasks addObject: text]; //将新的任务添加到模型
    [_mytable reloadData]; //表格视图重新载⼊入数据
    [_myText setText:@""]; //清空输⼊入框
    [_myText resignFirstResponder]; //关闭软键盘
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_mytable setDataSource:self];
    _tasks = [[NSMutableArray alloc] init];
    NSArray *plist = [NSArray arrayWithContentsOfFile:[self docPath]];
    if (plist) {
        _tasks = [plist mutableCopy];
    }
//    if ([_tasks count] == 0) {
//        [_tasks addObject:@"Walk the dogs"];
//        [_tasks addObject:@"Feed the hogs"];
//        [_tasks addObject:@"Chop the logs"];
//    }
    //[_mytable reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_mytable dequeueReusableCellWithIdentifier:@"Cell"]; if (!cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    NSString *item = [_tasks objectAtIndex: [indexPath row]]; [[cell textLabel] setText:item];
    return cell ;
}

-(NSString *)docPath {
    NSArray *pathList = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathList objectAtIndex:0] stringByAppendingPathComponent:@"data.txt"];
}
@end
