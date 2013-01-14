# AZCalendarView

Calendar library has similar delegate methods to a `UITableView`


![calendar](https://raw.github.com/azu/AZCalendarView/develop/images/Screenshot_Calendar.png)


# Breakdown

* support iPhone and iPad
* It has similar delegate methods to a `UITableViewDataSource`
* allow `allowsMultipleSelection`
* doesn't support landscape yet...

# Usage


``` objc
BaseDataSourceImp *dataSource = [[BaseDataSourceImp alloc] init];
BaseCalendarView *calendarView = [BaseCalendarView viewFromNib];// don't use alloc init...
calendarView.frame = CGRectMake(0, 0, selfb.view.bounds.size.width, self.calendarView.frame.size.height);
calendarView.dataSource = dataSource;
calendarView.delegate = self;// <AZCalendarViewDelegate>
[self.view addSubview:calendarView];
```

## Calendar Parts

You need to implement below(DEMO):

* BaseCalendarDisableGridView.xib (`AZCalendarGridView` subclass) disable GridView
* BaseCalendarGridView.xib (`AZCalendarGridView` subclass)  GridView
* BaseCalendarViewFooterView.xib (`AZCalendarViewFooterView` subclass) Calendar Footer(DEMO doesn't include...)
* BaseCalendarViewHeaderView.xib (`AZCalendarViewHeaderView` subclass)Calendar Header(move next/prev month)
* BaseCalendarWeekHintView.xib (`AZCalendarWeekHintView` subclass)day of the week(Mon,Tsu...)View
* BaseCalendar.xib (`AZCalendarView` subclass )each parts outlets)

## BaseDataSourceImp is implemented of `<AZCalendarViewDataSource>` .

``` objc

@implementation BaseDataSourceImp

#pragma mark - dataSource delegate
- (void)gridViewWillLayout:(AZCalendarView *)calendarView month:(AZCalMonth *)calMonth {
    // call before AZCalendarViewDataSource
}

- (void)gridViewDidLayout:(AZCalendarView *)calendarView month:(AZCalMonth *)calMonth {
    // call after AZCalendarViewDataSource
}

#pragma mark - update cell
- (void)updateGridView:(AZCalendarGridView *)gridView calendarGridViewForRow:(NSInteger)row
        column:(NSInteger)column calDay:(AZCalDay *)calDay {
    // update CalendarGridView (it'S similar UITableViewCell)
    BaseCalendarGridView *baseGridView = (BaseCalendarGridView *) gridView;
    baseGridView.recordImageView.hidden = (row != 0);
}

#pragma mark - delegate AZCalendarViewDataSource UI
- (AZCalendarViewHeaderView *)headerViewForCalendarView:(AZCalendarView *)calendarView {
    return [BaseCalendarViewHeaderView viewFromNib];
}

// Sun,Mon,Tsu ...
- (AZCalendarWeekHintView *)weekHintViewForCalendarView:(AZCalendarView *)calendarView {
    return [BaseCalendarWeekHintView viewFromNib];
}

- (AZCalendarGridView *)calendarView:(AZCalendarView *)calendarView calendarGridViewForRow:(NSInteger)row
                        column:(NSInteger)column calDay:(AZCalDay *)calDay {
    static NSString *identifier = @"BaseCalendarGridView";
    AZCalendarGridView *gridView = [calendarView dequeueCalendarGridViewWithIdentifier:identifier];
    if (!gridView){
        gridView = [BaseCalendarGridView viewFromNibWithIdentifier:identifier];
    }
    [self updateGridView:gridView calendarGridViewForRow:row column:column calDay:calDay];

    return gridView;
}

- (AZCalendarGridView *)calendarView:(AZCalendarView *)calendarView calendarDisableGridViewForRow:(NSInteger)row
                        column:(NSInteger)column calDay:(AZCalDay *)calDay {
    static NSString *identifier = @"BaseCalendarDisableGridView";
    AZCalendarGridView *gridView = [calendarView dequeueCalendarGridViewWithIdentifier:identifier];
    if (!gridView){
        gridView = [BaseCalendarDisableGridView viewFromNibWithIdentifier:identifier];
    }
    return gridView;
}

/*
- (NSArray *)weekTitlesForCalendarView:(AZCalendarView *)calendarView {
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
}

- (AZCalendarViewFooterView *)footerViewForCalendarView:(AZCalendarView *)calendarView {
    return [BaseCalendarViewFooterView viewFromNib];
}
*/

- (NSString *)calendarView:(AZCalendarView *)calendarView titleForMonth:(AZCalMonth *)calMonth {
    NSString *title = [NSString stringWithFormat:@"%d/%d", [calMonth getYear], [calMonth getMonth]];
    return title;
}
@end
```

### update calendar view

* use `[calendarView reloadData];`
* or `updateCalendarView` method of `AZCalendar/DEMO`


`updateCalendarView` method is implement of `updateCell:atIndexPath:` via [UITableViewについて — ios-practice](http://ios-practice.readthedocs.org/en/latest/docs/tableview/ "UITableViewについて — ios-practice 0.1 documentation")

# Details

See `AZCalendar/DEMO` and `AZCalendar.h` for details.

# Acknowledgment

These source codes base on [heavensword / CalendarView](https://github.com/heavensword/CalendarView "heavensword / CalendarView").