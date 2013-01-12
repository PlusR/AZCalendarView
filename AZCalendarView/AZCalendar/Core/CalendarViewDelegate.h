//
//  CalendarDelegate.h
//  AZCalendar
//
//  Created by huajian zhou on 12-4-12.
//  Copyright (c) 2012年 Sword.Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AZCalendarEnum.h"
@class CalendarView;
@class CalDay;

@protocol CalendarViewDelegate <NSObject>
@optional
- (void)calendarView:(CalendarView *)calendarView didSelectDay:(CalDay*)calDay;
- (void)calendarView:(CalendarView *)calendarView didSelectPeriodType:(PeriodType)periodType;
@end
