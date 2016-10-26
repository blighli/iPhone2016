//
//  CommonDayColCell.h
//
//


#import <UIKit/UIKit.h>

@interface CommonDayColCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;

+ (UINib *)nib;

@end
