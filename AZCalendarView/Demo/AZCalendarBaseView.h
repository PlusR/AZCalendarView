//
//  Created by azu on 13/01/11.
//


#import <Foundation/Foundation.h>
#import "CalendarViewDelegate.h"

@class CalendarView;


@interface AZCalendarBaseView : UIView <CalendarViewDelegate>

@property(nonatomic, strong) CalendarView *calendarView;

@end