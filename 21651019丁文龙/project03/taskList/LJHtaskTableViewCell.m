
#import "LJHtaskTableViewCell.h"

@implementation LJHtaskTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)taskFinished:(id)sender {
    //要删除这条记录，刷新tableView,通知delegate 调用方法
    [self.delegate finishedTaskTableViewCell:self];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
