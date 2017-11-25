//
//  NSDateAdditional.m
//  XQTimePickerDemo
//
//  Created by Candy Love on 15/12/22.
//  Copyright © 2015年 XQ. All rights reserved.
//

#import "NSDate+Additional.h"
#import "CWTMTimeVO.h"

@implementation NSDate(Additional)
+ (NSDate *)dateStartFromYear:(NSInteger)year{
    return [NSDate dateFromSecond:0 minute:0 hour:0 day:1 month:1 year:year];
}
+ (NSDate *)dateEndFromYear:(NSInteger)year{
    return [NSDate dateFromSecond:59 minute:59 hour:23 day:31 month:12 year:year];
}

+ (NSDate *)dateFromSecond:(NSInteger)second minute:(NSInteger)minute hour:(NSInteger)hour day:(NSInteger)day month:(NSInteger)month year:(NSInteger)year{

    NSString *strDate = nil;//[NSString stringWithFormat:@"%zd-%zd-%zd %zd:%zd:%zd",year,month,day,hour,minute,second];
    NSString *monthStr =  [NSString stringWithFormat:@"%zd",month];
    NSString *dayStr =  [NSString stringWithFormat:@"%zd",day];
    NSString *hourStr =  [NSString stringWithFormat:@"%zd",hour];
    NSString *minuteStr =  [NSString stringWithFormat:@"%zd",minute];
    NSString *secondStr =  [NSString stringWithFormat:@"%zd",second];
    if (month/10 == 0) {
        monthStr =  [NSString stringWithFormat:@"0%zd",month];
    } if (day/10 == 0) {
        dayStr =  [NSString stringWithFormat:@"0%zd",day];
    }
    if (hour/10 == 0) {
        hourStr =  [NSString stringWithFormat:@"0%zd",hour];
    }
    if (minute/10 == 0) {
        minuteStr =  [NSString stringWithFormat:@"0%zd",minute];
    }
    if (second/10 == 0) {
        secondStr =  [NSString stringWithFormat:@"0%zd",second];
    }
    strDate = [NSString stringWithFormat:@"%zd-%@-%@ %@:%@:%@",year,monthStr,dayStr,hourStr,minuteStr,secondStr];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *retdate = [dateFormatter dateFromString:strDate];
    return retdate;
}

+ (NSDate *)dateFromYYYYMMDDHHMMSS:(NSString *)strDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *retdate = [dateFormatter dateFromString:strDate];
    return retdate;
}

+ (NSDate *)dateFromYYYYMMDDHHMM:(NSString *)strDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *retdate = [dateFormatter dateFromString:strDate];
    return retdate;
}
+ (NSDate *)dateFromYYYYMMDD:(NSString *)strDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *retdate = [dateFormatter dateFromString:strDate];
    return retdate;
}
+ (NSDate *)HHMM:(NSString *)strDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSDate *retdate = [dateFormatter dateFromString:strDate];
    return retdate;
}
- (NSUInteger)numberOfDaysInMonth
{
    NSCalendar *c = [NSCalendar currentCalendar];
    NSRange days = [c rangeOfUnit:NSCalendarUnitDay
                           inUnit:NSCalendarUnitMonth
                          forDate:self];
    return days.length;
}

+ (double)endTimeIntervalWithTimeInterval:(double)timeInterval {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    calendar.locale  = [NSLocale systemLocale];
    calendar.timeZone = [NSTimeZone systemTimeZone];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;

    NSDateComponents *comps  = [calendar components:unitFlags fromDate:date];

    [comps setHour:23];
    [comps setMinute:59];
    [comps setSecond:59];

    NSDate *resultDate = [calendar dateFromComponents:comps];
    return [resultDate timeIntervalSince1970];
}

//根据type处理传入的date
- (NSDate *)dateWithTimePickerType:(CWTMTimePickerType)type{
    NSDate *dealDate = nil;
    CWTMTimeVO *timeVo = [[CWTMTimeVO alloc]initWithDate:self];
    switch (type) {
        case CWTMTimePickerType_HM:
        {
            //目前没有此应用场景，按照YMDHM处理
            dealDate = [NSDate dateFromSecond:0
                                       minute:[timeVo.minute integerValue]
                                         hour:[timeVo.hour integerValue]
                                          day:[timeVo.day integerValue]
                                        month:[timeVo.month integerValue]
                                         year:[timeVo.year integerValue]];
        }
            break;
        case CWTMTimePickerType_YMD:
        {
            dealDate = [NSDate dateFromSecond:0
                                       minute:0
                                         hour:0
                                          day:[timeVo.day integerValue]
                                        month:[timeVo.month integerValue]
                                         year:[timeVo.year integerValue]];
        }
            break;
        case CWTMTimePickerType_YMDH:
        {
            dealDate = [NSDate dateFromSecond:0
                                       minute:0
                                         hour:[timeVo.hour integerValue]
                                          day:[timeVo.day integerValue]
                                        month:[timeVo.month integerValue]
                                         year:[timeVo.year integerValue]];
        }
            break;
        default:
            dealDate = self;
            break;
    }
    return dealDate;
}
@end
