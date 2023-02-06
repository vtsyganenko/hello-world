//
//  main.m
//  DateInterval
//
//  Created by Виталий Цыганенко on 06.02.2023.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // NSTimeInterval - typedef double (seconds)
        // NSDateInterval - object, interval between start date and stop date
        
        // creating
        NSDateInterval* dateInterval = [[NSDateInterval alloc] init];
        NSLog(@"default date interval %@", dateInterval);
        
        NSDate* date = [NSDate dateWithTimeIntervalSinceNow:60];
        dateInterval = [[NSDateInterval alloc] initWithStartDate:date duration:120];
        NSLog(@"interval from now+60 with 120 sec %@", dateInterval);
        
        NSDate* date1 = [NSDate dateWithTimeIntervalSinceNow:3600];
        dateInterval = [[NSDateInterval alloc] initWithStartDate:date endDate:date1];
        NSLog(@"interval from now+60 to now+3600: %@", dateInterval);
        NSLog(@" ");
        
        // properties
        
        NSLog(@"getters for last interval:");
        NSLog(@"start date %@", [dateInterval startDate]);
        NSLog(@"end date %@", [dateInterval endDate]);
        NSLog(@"duration %g", [dateInterval duration]);
        
        // comparison
        
        NSDateInterval* dateInterval1 = [[NSDateInterval alloc] initWithStartDate:[NSDate now] duration:3540];
        NSLog(@"other dateInterval:");
        NSLog(@"start date %@", [dateInterval1 startDate]);
        NSLog(@"end date %@", [dateInterval1 endDate]);
        NSLog(@"duration %g", [dateInterval1 duration]);
        NSComparisonResult result = [dateInterval compare:dateInterval1];
        if(result == NSOrderedSame) {
            NSLog(@"NSOrderedSame");
        }
        else if(result == NSOrderedAscending) {
            NSLog(@"NSOrderedAscending");
        }
        else {
            NSLog(@"NSOrderedDescending");
        }
        NSLog(@" ");
        
        /*
        NSOrderedAscending if the receiver’s startDate occurs earlier than that of dateInterval, or both startDate values are equal and the duration of the receiver is less than that of dateInterval.
         
        NSOrderedDescending if the receiver’s startDate occurs later than that of dateInterval, or both startDate values are equal and the duration of the receiver is greater than that of dateInterval.
         
        NSOrderedSame if the receiver’s startDate and duration values are equal to those of dateInterval.
        */
        
        // intersection
        
        NSDateInterval* intersection;
        if([dateInterval intersectsDateInterval:dateInterval1]) {
            intersection = [dateInterval intersectionWithDateInterval:dateInterval1];
            NSLog(@"intersection interval:");
            NSLog(@"start date %@", [intersection startDate]);
            NSLog(@"end date %@", [intersection endDate]);
            NSLog(@"duration %g", [intersection duration]);
        }
        else {
            NSLog(@"no intersection between intervals");
        }
        
        // is contains date ?
        if(intersection) {
            NSTimeInterval half = [intersection duration] / 2;
            NSDate* middle = [NSDate dateWithTimeInterval:half sinceDate:[intersection startDate]];
            NSLog(@"middle of intersection is %@", middle);
            
            NSLog(@"does intersection contains middle? %@",
                  [intersection containsDate:middle] ? @"YES" : @"NO");
            NSLog(@"does intersection contains (1970)? %@",
                  [intersection containsDate:[NSDate dateWithTimeIntervalSince1970:0]] ? @"YES" : @"NO");
        }
        

    }
    return 0;
}
