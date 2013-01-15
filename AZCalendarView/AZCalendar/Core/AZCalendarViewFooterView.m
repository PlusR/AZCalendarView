//
//  AZCalendarViewFooterView.m
//  AZCalendar
//
//  Created by huajian zhou on 12-4-12.
//  Copyright (c) 2012年 Sword.Zhou. All rights reserved.
//

#import "AZCalendarViewFooterView.h"

@implementation AZCalendarViewFooterView

@synthesize selectedButton = _selectedButton;
@synthesize delegate = _delegate;

- (void)dealloc {
    _delegate = nil;
}

+ (AZCalendarViewFooterView *)viewFromNib {
    Class selfClass = [self class];
    return [[[NSBundle bundleForClass:selfClass] loadNibNamed:NSStringFromClass(selfClass) owner:self options:nil]
                       objectAtIndex:0];
}
@end
