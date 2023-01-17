//
//  main.m
//  ArraysExample
//
//  Created by Виталий Цыганенко on 17.01.2023.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // immutable
        
        NSArray* months = [NSArray arrayWithObjects:
            @"January", @"February", @"March", @"April",
            @"May", @"June", @"July", @"August", @"September",
            @"October", @"November", @"December", nil];
        
        for(int i=0; i<12; ++i) {
            NSLog(@" %2i     %@", i+1, [months objectAtIndex: i]);
        }
        NSLog(@"\n");
        
        NSArray* numbers = @[@"one", @"two", @"three", @"four", @"five"];
        for(int i=0; i<[numbers count]; ++i) {
            NSLog(@" %i      %@", i+1, numbers[i]);
        }
        NSLog(@"\n");
        
        // mutable
        
        NSMutableArray* mutnums = [NSMutableArray arrayWithObjects:
                                   @"one", @"two", @"three", @"four", @"five", nil];
        NSLog(@"mutable:");
        NSLog(@"%@", mutnums);
        mutnums[1] = @"2";
        [mutnums replaceObjectAtIndex: 3 withObject: @"4"];
        NSLog(@"%@", mutnums);
        
        NSMutableArray* marr = [NSMutableArray array];
        for(int i=0; i<10; ++i) {
            marr[i] = @(i);
        }
        NSLog(@"created mutable array: %@", marr);
        // add to the end
        [marr addObject: @(10)];
        NSLog(@"%@", marr);
        
        
    }
    return 0;
}
