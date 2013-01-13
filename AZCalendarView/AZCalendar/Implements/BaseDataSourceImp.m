//
//  BaseDataSourceImp.m
//  AZCalendar
//
//  Created by huajian zhou on 12-4-12.
//  Copyright (c) 2012年 Sword.Zhou. All rights reserved.
//

#import "BaseDataSourceImp.h"
#import "BaseCalendarGridView.h"
#import "BaseCalendarDisableGridView.h"
#import "BaseCalendarViewHeaderView.h"
#import "CalMonth.h"
#import "CalendarWeekHintView.h"
#import "BaseCalendarWeekHintView.h"
#import "CalendarView.h"

@implementation BaseDataSourceImp {
}

#pragma mark - dataSource delegate
- (void)gridViewWillLayout:(CalendarView *)calendarView month:(CalMonth *)calMonth {
}

- (void)gridViewDidLayout:(CalendarView *)calendarView month:(CalMonth *)calMonth {

}

#pragma mark - update cell
- (void)updateGridView:(CalendarGridView *)gridView calendarGridViewForRow:(NSInteger)row
        column:(NSInteger)column calDay:(CalDay *)calDay {

    BaseCalendarGridView *baseGridView = (BaseCalendarGridView *) gridView;

    NSInteger randomRow = arc4random() % 5;
    NSInteger randomColumn = arc4random() % 7;
    baseGridView.recordImageView.hidden = (row != 0);
    baseGridView.morningImageView.hidden = (row != 1);
    baseGridView.noonImageView.hidden = (row != 2);
    baseGridView.nightImageView.hidden = (row != 3);
}

#pragma mark - build UI
- (CalendarViewHeaderView *)headerViewForCalendarView:(CalendarView *)calendarView {
    return [BaseCalendarViewHeaderView viewFromNib];
}

// Sun,Mon,Tsu ...
- (CalendarWeekHintView *)weekHintViewForCalendarView:(CalendarView *)calendarView {
    return [BaseCalendarWeekHintView viewFromNib];
}

- (CalendarGridView *)calendarView:(CalendarView *)calendarView calendarGridViewForRow:(NSInteger)row
                      column:(NSInteger)column calDay:(CalDay *)calDay {
    static NSString *identifier = @"BaseCalendarGridView";
    CalendarGridView *gridView = [calendarView dequeueCalendarGridViewWithIdentifier:identifier];
    if (!gridView){
        gridView = [BaseCalendarGridView viewFromNibWithIdentifier:identifier];
    }
    [self updateGridView:gridView calendarGridViewForRow:row column:column calDay:calDay];
    return gridView;
}

- (CalendarGridView *)calendarView:(CalendarView *)calendarView calendarDisableGridViewForRow:(NSInteger)row
                      column:(NSInteger)column calDay:(CalDay *)calDay {
    static NSString *identifier = @"BaseCalendarDisableGridView";
    CalendarGridView *gridView = [calendarView dequeueCalendarGridViewWithIdentifier:identifier];
    if (!gridView){
        gridView = [BaseCalendarDisableGridView viewFromNibWithIdentifier:identifier];
    }
    return gridView;
}

/*
- (NSArray *)weekTitlesForCalendarView:(CalendarView *)calendarView {
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
}

- (CalendarViewFooterView *)footerViewForCalendarView:(CalendarView *)calendarView {
    return [BaseCalendarViewFooterView viewFromNib];
}
*/

- (NSString *)calendarView:(CalendarView *)calendarView titleForMonth:(CalMonth *)calMonth {
    NSString *title = [NSString stringWithFormat:@"%d/%d", [calMonth getYear], [calMonth getMonth]];
    return title;
}
@end
