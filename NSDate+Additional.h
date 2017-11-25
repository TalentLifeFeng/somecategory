//
//  NSDateAdditional.h
//  XQTimePickerDemo
//
//  Created by Candy Love on 15/12/22.
//  Copyright © 2015年 XQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate(Additional)
//一年开头时间
+ (NSDate *)dateStartFromYear:(NSInteger)year;
//一年结尾时间
+ (NSDate *)dateEndFromYear:(NSInteger)year;
+ (NSDate *)dateFromSecond:(NSInteger)second minute:(NSInteger)minute hour:(NSInteger)hour day:(NSInteger)day month:(NSInteger)month year:(NSInteger)year;
+ (NSDate *)dateFromYYYYMMDDHHMM:(NSString *)strDate;
+ (NSDate *)dateFromYYYYMMDDHHMMSS:(NSString *)strDate;
+ (NSDate *)dateFromYYYYMMDD:(NSString *)strDate;
+ (NSDate *)HHMM:(NSString *)strDate;
- (NSUInteger)numberOfDaysInMonth;

// 一天最后一秒的时间戳
+ (double)endTimeIntervalWithTimeInterval:(double)timeInterval;

//根据type处理传入的date
- (NSDate *)dateWithTimePickerType:(CWTMTimePickerType)type;
@end
