//
//  main.m
//  Date
//
//  Created by Виталий Цыганенко on 06.02.2023.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // creating
        
        NSDate* date = [NSDate date];
        NSLog(@"default date object is now: %@", date);
        
        date = [NSDate dateWithTimeIntervalSinceNow:100];
        NSLog(@"now + 100 sec is: %@", date);
        
        date = [NSDate dateWithTimeIntervalSince1970:946684800];
        NSLog(@"date on timestamp (1970) 946684800 is: %@", date);
        
        date = [NSDate dateWithTimeIntervalSinceReferenceDate:200];
        NSLog(@"200 sec from 21st century began: %@", date);
        NSLog(@" ");
        
        // the similar methods with initWith... are available
        
        // properties
        
        date = [NSDate now];
        NSLog(@"property \"now\" contains date: %@", date);
        NSLog(@"timestamp (1970) to \"now\": %f", [date timeIntervalSince1970]);
        NSLog(@"from 21st century to \"now\": %f", [date timeIntervalSinceReferenceDate]);
        NSLog(@"from 1970 to 21st century: %f", NSTimeIntervalSince1970);
        NSLog(@" ");
        
        // comparison
        
        NSDate* date1 = [[NSDate alloc] init];
        NSDate* date2 = [NSDate date];
        NSLog(@"date1: %@ date2: %@", date1, date2);
        NSLog(@"date1 is equal to date2: %@", [date1 isEqual:date2] ? @"YES" : @"NO");
        NSLog(@"date2 is equal to date1: %@", [date2 isEqual:date1] ? @"YES" : @"NO");
        date2 = [NSDate dateWithTimeIntervalSinceNow:120];
        NSLog(@"update date2: %@", date2);
        NSLog(@"earlier date is %@", [date1 earlierDate:date2]);
        NSLog(@"later date is %@", [date1 laterDate:date2]);
        NSComparisonResult result = [date1 compare:date2];
        if(result == NSOrderedAscending) {
            NSLog(@"date1 is earlier than date2");
        }
        else if(result == NSOrderedSame) {
            NSLog(@"date1 and date2 are same");
        }
        else {
            NSLog(@"date1 is later than date2");
        }
        NSLog(@" ");
        
        // time interval
        
        NSLog(@"seconds from date1 to date2: %g", [date1 timeIntervalSinceDate:date2]);
        NSLog(@"seconds from date2 to date1: %g", [date2 timeIntervalSinceDate:date1]);
        NSLog(@"from 1970 to date1 %f seconds", [date1 timeIntervalSince1970]);
        NSLog(@"from 1970 to date2 %f seconds", [date2 timeIntervalSince1970]);
        NSLog(@" ");
        NSLog(@"date1 %@", date1);
        NSLog(@"date2 %@", date2);
        date1 = [date1 dateByAddingTimeInterval:120];
        NSLog(@"date1 + 120 sec = %@", date1);
        NSLog(@"date1 is equal date2: %@", [date1 isEqual:date2] ? @"YES" : @"NO");
        NSLog(@"interval from date1 to date2: %f", [date1 timeIntervalSinceDate:date2]);
        NSLog(@"interval from date2 to date1: %f", [date2 timeIntervalSinceDate:date1]);
        // so date1 != date2 due to small distinction
        
        // NSTimeInterval - typedef double (seconds)
        // NSDateInterval - object, interval between start date and stop date
    }
    return 0;
}
