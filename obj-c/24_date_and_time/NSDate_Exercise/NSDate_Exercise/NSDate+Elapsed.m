//
//  NSDate+Elapsed.m
//  NSDate_Exercise
//
//  Created by Виталий Цыганенко on 11.02.2023.
//

#import "NSDate+Elapsed.h"

@implementation NSDate (Elapsed)

-(NSInteger) elapsedDays1: (NSDate *) theDate {

    NSComparisonResult compared = [self compare:theDate];
    if(compared == NSOrderedSame) {
        return 0;
    }
    
    NSTimeInterval duration = 0;
    if(compared == NSOrderedAscending) {
        // receiver is earlier than theDate
        NSDateInterval* interval = [[NSDateInterval alloc] initWithStartDate:self endDate:theDate];
        duration = round([interval duration]);
    }
    else {
        // receiver is later then theDate
        NSDateInterval* interval = [[NSDateInterval alloc] initWithStartDate:theDate endDate:self];
        duration = round([interval duration]) * -1;
    }
    
    NSTimeInterval day = 60 * 60 * 24;
    NSInteger elapsed = duration / day;
    
    return elapsed;
}

-(NSInteger) elapsedDays2: (NSDate *) theDate {
    
    NSDate* earlier = [self earlierDate:theDate];
    NSDate* later = [self laterDate:theDate];
    NSDateInterval* interval = [[NSDateInterval alloc] initWithStartDate:earlier endDate:later];
    NSTimeInterval duration = round([interval duration]);
    
    NSTimeInterval day = 60 * 60 * 24;
    NSInteger elapsed = duration / day;
    
    return elapsed;
}

@end
