//
//  AZDateUtil.h
//  AZCalendar
//
//  Created by huajian zhou on 12-4-12.
//  Copyright (c) 2012年 Sword.Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZDateUtil : NSObject

+ (BOOL)isLeapYear:(NSInteger)year;

/*
 * @abstract calculate number of days by specified month and current year
 * @paras year range between 1 and 12
 */
+ (NSInteger)numberOfDaysInMonth:(NSInteger)month;

/*
 * @abstract calculate number of days by specified month and year
 * @paras year range between 1 and 12
 */
+ (NSInteger)numberOfDaysInMonth:(NSInteger)month year:(NSInteger)year;

+ (NSInteger)getCurrentYear;

+ (NSInteger)getCurrentMonth;

+ (NSInteger)getCurrentDay;

+ (NSInteger)getMonthWithDate:(NSDate *)date;

+ (NSInteger)getDayWithDate:(NSDate *)date;

+ (NSDate *)dateSinceNowWithInterval:(NSInteger)dayInterval;

@end
