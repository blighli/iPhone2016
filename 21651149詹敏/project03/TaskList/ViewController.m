//
//  ViewController.m
//  TaskList
//
//  Created by zhanmin on 20/10/2016.
//  Copyright © 2016 zhanmin. All rights reserved.
//

#import "ViewController.h"

@interface TaskCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

@implementation TaskCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"TaskCell";
    [tableView registerClass:[TaskCell class] forCellReuseIdentifier:ID];
    return [tableView dequeueReusableCellWithIdentifier:ID];
}

@end

@interface ViewController () <UITableViewDataSource> {
    NSString *_reuseID;
    NSString *_filePath;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (nonatomic, strong) NSMutableArray<NSString *> *tasks;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _reuseID = @"TaskCell";
    _filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"tasks"];
    self.tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSMutableArray *tasks = [NSKeyedUnarchiver unarchiveObjectWithFile:_filePath];
    if (!tasks) {
        tasks = @[].mutableCopy;
    }
    self.tasks = tasks;
}

- (IBAction)addClick:(id)sender {
    NSString *content = self.inputField.text;
    if (!content) return;
    [self.tasks addObject:content];
    [self.tableView reloadData];
    [NSKeyedArchiver archiveRootObject:self.tasks toFile:_filePath];
    self.inputField.text = @"";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskCell *cell = [TaskCell cellWithTableView:tableView];
    cell.textLabel.text = self.tasks[indexPath.row];
    return cell;
}

@end
