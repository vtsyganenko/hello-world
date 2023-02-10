//
//  main.m
//  Calendar
//
//  Created by Виталий Цыганенко on 06.02.2023.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // NSDateComponents
        
        // An object that specifies a date or time in terms of units
        // (such as year, month, day, hour, and minute)
        // to be evaluated in a calendar system and time zone.
        NSDateComponents* dc = [[NSDateComponents alloc] init];
        // 08/10/2020 is monday
        dc.day = 10;
        dc.month = 8;
        dc.year = 2020;
        NSLog(@"custom date components: %@", dc);
        // NSDateComponents doesn't provide other data without specified calendar:
        NSLog(@"retrieve day of the week: %@", dc.weekday == NSDateComponentUndefined ?
              @"undefined" : [NSString stringWithFormat:@"%ld", dc.weekday]);
        
        // need to:
        // 1. create calendar
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        // 2. retrieve date from calendar and components
        NSDate *date = [calendar dateFromComponents:dc];
        NSLog(@"use gregorian calendar: %@", date);
        // retrieve weekday
        NSInteger weekday = [calendar component:NSCalendarUnitWeekday fromDate:date];
        NSLog(@"retrieve day of the week: %ld", weekday);
        // 2 - is a Monday for gregorian calendar
        // retrieve other data
        NSLog(@"retrieve time: %ld:%ld:%ld.%ld",
              [calendar component:NSCalendarUnitHour fromDate:date],
              [calendar component:NSCalendarUnitMinute fromDate:date],
              [calendar component:NSCalendarUnitSecond fromDate:date],
              [calendar component:NSCalendarUnitNanosecond fromDate:date]);
        NSLog(@"retrieve era: %ld year: %ld yearForWeek: %ld quarter: %ld month: %ld",
              [calendar component:NSCalendarUnitEra fromDate:date],
              [calendar component:NSCalendarUnitYear fromDate:date],
              [calendar component:NSCalendarUnitYearForWeekOfYear fromDate:date],
              [calendar component:NSCalendarUnitQuarter fromDate:date],
              [calendar component:NSCalendarUnitMonth fromDate:date]);
        NSLog(@"retrieve weekOfYear: %ld weekOfMonth: %ld weekday %ld ordinal %ld day %ld",
              [calendar component:NSCalendarUnitWeekOfYear fromDate:date],
              [calendar component:NSCalendarUnitWeekOfMonth fromDate:date],
              [calendar component:NSCalendarUnitWeekday fromDate:date],
              [calendar component:NSCalendarUnitWeekdayOrdinal fromDate:date],
              [calendar component:NSCalendarUnitDay fromDate:date]);
        NSLog(@"retrieve calendar: %ld", [calendar component:NSCalendarUnitCalendar fromDate:date]);
        NSLog(@"retrieve time zone: %ld", [calendar component:NSCalendarUnitTimeZone fromDate:date]);
        NSLog(@" ");
        
        // retrive values for date "now"

        NSLog(@"retrieve components from date");
        date = [NSDate now];
        NSLog(@"now: %@", date);
        NSLog(@"%ld:%ld:%ld.%ld",
              [calendar component:NSCalendarUnitHour fromDate:date],
              [calendar component:NSCalendarUnitMinute fromDate:date],
              [calendar component:NSCalendarUnitSecond fromDate:date],
              [calendar component:NSCalendarUnitNanosecond fromDate:date]);
        NSLog(@"era: %ld year: %ld yearForWeek: %ld quarter: %ld month: %ld",
              [calendar component:NSCalendarUnitEra fromDate:date],
              [calendar component:NSCalendarUnitYear fromDate:date],
              [calendar component:NSCalendarUnitYearForWeekOfYear fromDate:date],
              [calendar component:NSCalendarUnitQuarter fromDate:date],
              [calendar component:NSCalendarUnitMonth fromDate:date]);
        // other way
        dc = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitWeekOfMonth |
                                   NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal |
                                   NSCalendarUnitDay) fromDate:date];
        NSLog(@"weekOfYear: %ld weekOfMonth: %ld weekday %ld ordinal %ld day %ld",
              [dc weekOfYear], [dc weekOfMonth], [dc weekday], [dc weekdayOrdinal], [dc day]);
        NSLog(@" ");

        // NSCalendar
        
        // transfer date from calendars
        date = [NSDate now];
        NSUInteger unitFlags = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear |
            NSCalendarUnitWeekday;
        dc = [calendar components:unitFlags fromDate:date];
        NSLog(@"today on gregorian calendar: %ld/%ld/%ld weekday %ld", [dc month], [dc day], [dc year],
              [dc weekday]);
        NSCalendar* hebrew = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierHebrew];
        NSDateComponents* dc1 = [hebrew components:unitFlags fromDate:date];
        NSLog(@"today on hebrew calendar: %ld/%ld/%ld weekday %ld", [dc1 month], [dc1 day], [dc1 year],
              [dc1 weekday]);
        NSLog(@" ");
        
        // update current calendar
        NSLog(@"update current calendar:");
        NSCalendar* customCalendar = [NSCalendar autoupdatingCurrentCalendar];
        NSLog(@"time zone: %@", [customCalendar timeZone]);
        NSTimeZone* europe = [NSTimeZone timeZoneWithAbbreviation:@"CET"];
        [customCalendar setTimeZone:europe];
        NSLog(@"time zone: %@", [customCalendar timeZone]);
        date = [NSDate now];
        NSLog(@"date from system calendar: %@", date);
        dc = [customCalendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:date];
        NSLog(@"time from updated (CET) calendar: %ld:%ld", [dc hour], [dc minute]);
        NSLog(@" ");
        
        // current calendar info
        NSLog(@"current calendar info:");
        calendar = [NSCalendar currentCalendar];
        NSLocale* locale = [calendar locale];
        NSLog(@"locale: country %@ language %@ currency code %@ currency symbol %@",
              [locale countryCode], [locale languageCode], [locale currencyCode],
              [locale currencySymbol]);
        NSLog(@"time zone %@", [calendar timeZone]);
        NSLog(@" ");
        
        // other way to retrieve date values
        NSLog(@"retrieve values from date (another way):");
        date = [NSDate now];
        NSInteger era = 0;
        NSInteger year = 0;
        NSInteger month = 0;
        NSInteger day = 0;
        NSInteger hour = 0;
        NSInteger min = 0;
        NSInteger sec = 0;
        NSInteger nanosec = 0;
        // use current calendar
        [calendar getEra:&era year:&year month:&month day:&day fromDate:date];
        NSLog(@"current calendar gives:");
        NSLog(@"era %ld year %ld month %ld day %ld", era, year, month, day);
        [calendar getHour:&hour minute:&min second:&sec nanosecond:&nanosec fromDate:date];
        NSLog(@"%ld : %ld : %ld . %ld", hour, min, sec, nanosec);
        NSCalendar* japan = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierJapanese];
        [japan getEra:&era year:&year month:&month day:&day fromDate:date];
        NSLog(@"japan calendar gives:");
        NSLog(@"era %ld year %ld month %ld day %ld", era, year, month, day);
        [japan getHour:&hour minute:&min second:&sec nanosecond:&nanosec fromDate:date];
        NSLog(@"%ld : %ld : %ld . %ld", hour, min, sec, nanosec);
        NSLog(@" ");
        
        // NSDateFormatter
        NSLog(@"NSDateFormatter");
        date = [NSDate now];
        NSLog(@"short: %@", [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle]);
        NSLog(@"medium: %@", [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle]);
        NSLog(@"long: %@", [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle]);
        NSLog(@"full: %@", [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterFullStyle timeStyle:NSDateFormatterFullStyle]);
        
        NSLog(@"use american style:");
        NSDateFormatter* format = [[NSDateFormatter alloc] init];
        [format setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
        [format setDateStyle:NSDateFormatterShortStyle];
        [format setTimeStyle:NSDateFormatterShortStyle];
        NSLog(@"stringFromDate: %@", [format stringFromDate:date]);
        
        NSLog(@"use user style:");
        format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"EEEE yyyy_MM_dd HH::mm::ss.SSS Z"];
        NSLog(@"stringFromDate: %@", [format stringFromDate:date]);
        NSLog(@" ");
        
        NSLog(@"date from string:");
        format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy.MM.dd"];
        NSString* str1 = @"2023.02.18";
        NSLog(@"string: %@ date %@", str1, [format dateFromString:str1]);
        [format setDateFormat:@"MM.dd.yy HH:mm:ss"];
        NSString* str2 = @"02.01.23 15:40:20";
        NSLog(@"string: %@ date %@", str2, [format dateFromString:str2]);
        
        
    }
    return 0;
}
