

#import "ViewController.h"

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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:_reuseID];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_reuseID];
    cell.textLabel.text = self.tasks[indexPath.row];
    return cell;
}

@end
