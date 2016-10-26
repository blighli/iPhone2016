//
//  ViewController.h
//  toDoList
//


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *taskInput;
- (IBAction)insertTask:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *taskTableView;

@end

