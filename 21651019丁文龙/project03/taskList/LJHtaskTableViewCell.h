
#import <UIKit/UIKit.h>
@protocol  LJHtaskTableViewCellDelegate;
@interface LJHtaskTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (strong, nonatomic) id<LJHtaskTableViewCellDelegate> delegate;

@end

@protocol LJHtaskTableViewCellDelegate <NSObject>

- (void)finishedTaskTableViewCell:(LJHtaskTableViewCell *)cell;

@end
