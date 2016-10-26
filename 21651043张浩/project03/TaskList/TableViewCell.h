

#import <UIKit/UIKit.h>

@protocol  TableViewCellDelegate;
@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *taskLabel;

@property (strong, nonatomic) id<TableViewCellDelegate> delegate;

@end

@protocol TableViewCellDelegate <NSObject>

- (void)finishedTaskTableViewCell:(TableViewCell *)cell;


@end
