//
//  main.m
//  NSDate_Exercise
//
//  Created by Виталий Цыганенко on 11.02.2023.
//

#import <Foundation/Foundation.h>

#import "NSDate+Elapsed.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDate* dateNow = [NSDate now];
        NSLog(@"date now: %@", dateNow);
        
        NSTimeInterval day = 60 * 60 * 24;
        
        NSDate* datePast = [NSDate dateWithTimeIntervalSinceNow: -2 * day];
        NSLog(@"date past: %@", datePast);
        
        NSDate* dateFuture = [NSDate dateWithTimeIntervalSinceNow: 3 * day];
        NSLog(@"date future: %@", dateFuture);
        
        NSLog(@" ");
        NSLog(@"Test \"elapsedDays1\" method:");
        
        NSInteger daysElapsed = [dateNow elapsedDays1:dateFuture];
        NSLog(@"days elapsed from date now to date future: %ld", daysElapsed);
        
        daysElapsed = [dateNow elapsedDays1:datePast];
        NSLog(@"days elapsed from date now to date past: %ld", daysElapsed);
        
        daysElapsed = [dateNow elapsedDays1:dateNow];
        NSLog(@"days elapsed from date now to date now: %ld", daysElapsed);
        
        NSLog(@" ");
        NSLog(@"Test \"elapsedDays2\" method:");
        
        daysElapsed = [dateNow elapsedDays2:dateFuture];
        NSLog(@"days elapsed from date now to date future: %ld", daysElapsed);
        
        daysElapsed = [dateNow elapsedDays2:datePast];
        NSLog(@"days elapsed from date now to date past: %ld", daysElapsed);
        
        daysElapsed = [dateNow elapsedDays2:dateNow];
        NSLog(@"days elapsed from date now to date now: %ld", daysElapsed);
        
    }
    return 0;
}
