//
//  ViewController.m
//  CalendarDemo
//

#import "ViewController.h"
#import "DayColReusableView.h"
#import "CommonDayColCell.h"

#define kSCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,assign) NSInteger totalDayThisMonth;  //本月总天数
@property (nonatomic,assign) NSInteger totalDayLastMonth;   //上月总天数 :
@property (nonatomic,assign) NSInteger fisrtWeekDay;   //本月第一天周几：
@property (nonatomic,assign) NSInteger firstWeekDayNextMonth;   //下月第一天周几：

@property (nonatomic,assign) NSInteger lastSum;     // = fisrtWeekDay //显示上个月格子数：
@property (nonatomic,assign) NSInteger nextSum;     //= 7 - firstWeekDayNM;  //显示下个月格子数：
@property (nonatomic,assign) NSInteger sumDays;     //= totalDayThisMonth + nextSum + lastSum  显示总各自数：
//sumDays/7  总行数：

@property (nonatomic,strong) NSDateComponents *comps;
@property (nonatomic,strong) NSCalendar *calender;
@end

@implementation ViewController



static NSString * const dayColID = @"dayColID";
static NSString * const headerIdentifier = @"headerIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.calender = [NSCalendar currentCalendar];
    [self.calender setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];

    self.comps =  [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
    NSInteger thisMonth = [self.comps month];
    NSInteger thisYear = [self.comps year];
    //    NSInteger thisDay = [self.comps day];

    NSLog(@"thisYear -- %ld,thisMonth -- %ld",(long)thisYear,(long)thisMonth);

    _totalDayThisMonth = [self getTotalDaysThisMonth:[NSDate date]];
    _totalDayLastMonth = [self getTotalDaysWithMonth:thisMonth - 1 withYear:thisYear];

    NSLog(@"_totalDayLastMonth -- %ld,_totalDayThisMonth -- %ld",_totalDayLastMonth,_totalDayThisMonth);

    _fisrtWeekDay          = [self getWeekdayWithYear:thisYear month:thisMonth day:1];
    _firstWeekDayNextMonth = [self getWeekdayWithYear:thisYear month:thisMonth + 1 day:1];

    NSLog(@"_fisrtWeekDay -- %ld,_firstWeekDayNextMonth -- %ld",(long)_fisrtWeekDay,(long)_firstWeekDayNextMonth);

    if (_fisrtWeekDay == 7) {
        _lastSum = 0;
    }else{
        _lastSum = _fisrtWeekDay;
    }

    _nextSum = 7 - _firstWeekDayNextMonth;
    _sumDays = _totalDayThisMonth + _nextSum + _lastSum;

    [self collectionView];

}

- (IBAction)btnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - UICollectionViewDataSource


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _sumDays;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    CommonDayColCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:dayColID forIndexPath:indexPath];

//    cell.backgroundColor = [UIColor colorWithRed:229 green:229 blue:229 alpha:0.5];
    cell.dayLabel.textColor = [UIColor groupTableViewBackgroundColor];

    //显示上个月日期
    if (indexPath.row < _lastSum) {
        //上月数据
        cell.dayLabel.text = [NSString stringWithFormat:@"%ld",(_totalDayLastMonth - _fisrtWeekDay + 1 + indexPath.row)];

    }else if(indexPath.row < _totalDayThisMonth + _lastSum){
        //本月数据展示
        cell.dayLabel.text = [NSString stringWithFormat:@"%ld",(indexPath.row + 1 - _lastSum)];
        cell.dayLabel.font = [UIFont boldSystemFontOfSize:14];
//        cell.dayLabel.textColor = [UIColor colorWithRed:43 green:45 blue:49 alpha:0.5];
        cell.dayLabel.textColor = [UIColor blackColor];
        cell.backgroundColor = [UIColor whiteColor];
    }else{
        //下个月数据显示
        cell.dayLabel.text = [NSString stringWithFormat:@"%ld",(indexPath.row + 1 - _totalDayThisMonth - _lastSum)];
    }

    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectItemAtIndexPath -- %ld",(long)indexPath.row);

}



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {

        DayColReusableView * headerCell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier forIndexPath:indexPath];

        NSString *year = [NSString stringWithFormat:@"%ld",(long)[self.comps year]];
        NSString *month =[NSString stringWithFormat:@"%ld",(long)[self.comps month]];
        [headerCell updateTimer:@[year , month]];

        return headerCell;
    }
    return nil;
}



#pragma mark - Getter
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];

        float colW = kSCREEN_WIDTH - 30;
        float cellW = colW/7;
        float cellH = cellW;

        float headerW = colW;
        float headerH = 50;

        [flowLayout setItemSize:CGSizeMake(cellW, cellH)];//设置cell的尺寸
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];//设置其布局方向
        [flowLayout setHeaderReferenceSize:CGSizeMake(headerW, headerH)];

        [flowLayout setMinimumInteritemSpacing:0];
        [flowLayout setMinimumLineSpacing:0];
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//设置整个section的边界

        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;

        CGFloat colH = (_sumDays / 7) * cellH + headerH + 3;

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(15, 100, colW, colH) collectionViewLayout:flowLayout];
//        _collectionView.backgroundColor = [UIColor redColor];
        _collectionView.backgroundColor = [UIColor clearColor];

        [_collectionView registerNib:[CommonDayColCell nib] forCellWithReuseIdentifier:dayColID];
        [_collectionView registerNib:[UINib nibWithNibName:@"DayColReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];

        _collectionView.delegate = self;
        _collectionView.dataSource = self;

        _collectionView.layer.borderWidth = 3;
        _collectionView.layer.cornerRadius = 1;
        _collectionView.layer.borderColor = [UIColor colorWithRed:51 green:53 blue:58 alpha:1].CGColor;

        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

#pragma mark - 获取当前月总天数NSInteger
- (NSInteger)getTotalDaysThisMonth:(NSDate *)date{

    NSRange range = [self.calender rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];

    return range.length;
}



#pragma mark - 判断给定月份的天数int
- (int)getTotalDaysWithMonth:(NSInteger)month withYear:(NSInteger)year{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:month];
    [comps setYear:year];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorian dateFromComponents:comps];
    NSRange days = [gregorian rangeOfUnit:NSCalendarUnitDay
                                   inUnit:NSCalendarUnitMonth
                                  forDate:date];
    return (int)days.length;
}


#pragma mark - 判断给定日期是周几
//返回1--周一，7--周日
- (NSInteger)getWeekdayWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:day];
    [comps setMonth:month];
    [comps setYear:year];


    NSDate *date = [self.calender dateFromComponents:comps];
    NSLog(@"date -- %@",date);
    NSDateComponents *weekdayComponents = [self.calender components:NSCalendarUnitWeekday fromDate:date];

    NSInteger weekDayNum =[weekdayComponents weekday] - 1;

    if (weekDayNum == 0) {
        weekDayNum = 7;
    }

    return weekDayNum;
}


@end
