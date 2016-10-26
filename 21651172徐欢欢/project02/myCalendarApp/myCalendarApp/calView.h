//
//  calView.h
//  myCalendarApp
//
//  Created by 徐欢欢 on 16/10/26.
//  Copyright © 2016年 徐欢欢. All rights reserved.
//

#ifndef calView_h
#define calView_h
@interface NSDate (Formatter)

+(NSDate *)yesterday;

+(NSDateFormatter *)formatter;
+(NSDateFormatter *)formatterWithoutTime;
+(NSDateFormatter *)formatterWithoutDate;

-(NSString *)formatWithUTCTimeZone;
-(NSString *)formatWithLocalTimeZone;
-(NSString *)formatWithTimeZoneOffset:(NSTimeInterval)offset;
-(NSString *)formatWithTimeZone:(NSTimeZone *)timezone;

-(NSString *)formatWithUTCTimeZoneWithoutTime;
-(NSString *)formatWithLocalTimeZoneWithoutTime;
-(NSString *)formatWithTimeZoneOffsetWithoutTime:(NSTimeInterval)offset;
-(NSString *)formatWithTimeZoneWithoutTime:(NSTimeZone *)timezone;

-(NSString *)formatWithUTCWithoutDate;
-(NSString *)formatWithLocalTimeWithoutDate;
-(NSString *)formatWithTimeZoneOffsetWithoutDate:(NSTimeInterval)offset;
-(NSString *)formatTimeWithTimeZone:(NSTimeZone *)timezone;


+ (NSString *)currentDateStringWithFormat:(NSString *)format;
+ (NSDate *)dateWithSecondsFromNow:(NSInteger)seconds;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day;
- (NSString *)dateWithFormat:(NSString *)format;

//Other
- (NSString *)mmddByLineWithDate;
- (NSString *)yyyyMMByLineWithDate;
- (NSString *)yyyyMMddByLineWithDate;
- (NSString *)mmddChineseWithDate;
- (NSString *)hhmmssWithDate;

- (NSString *)morningOrAfterWithHH;
@end



#endif /* calView_h */
