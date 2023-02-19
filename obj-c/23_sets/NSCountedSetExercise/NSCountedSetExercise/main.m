//
//  main.m
//  NSCountedSetExercise
//
//  Created by Виталий Цыганенко on 19.02.2023.
//

#import <Foundation/Foundation.h>

@interface NSCountedSet (Print)
-(void) print: (NSString*) label;
@end

@implementation NSCountedSet (Print)
-(void) print: (NSString*) label {
    printf("%s with count %lu: ", [label UTF8String], [self count]);
    for(id obj in self) {
        printf("%s (%lu) ", [[obj description] UTF8String], [self countForObject:obj]);
    }
    printf("\n");
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Kochan - Programming in Objective-C 6th
        // chapter 15, exercise 10
        
        NSArray* array = @[@10, @12, @-5, @10, @-5, @0, @-5, @15];
        NSCountedSet* set = [NSCountedSet setWithArray:array];
        [set print:@"set"];
        
        NSMutableArray* mutableArr = [NSMutableArray arrayWithArray:[set allObjects]];
        [mutableArr sortUsingComparator:
            ^NSComparisonResult(id obj1, id obj2) {
            NSUInteger count1 = [set countForObject:obj1];
            NSUInteger count2 = [set countForObject:obj2];
            if(count1 > count2)
                return NSOrderedAscending;
            else if(count1 < count2)
                return NSOrderedDescending;
            else
                return NSOrderedSame;
        }];
        
        printf("sorted by count:\n");
        for(id obj in mutableArr) {
            printf("%s (%lu) ", [[obj description] UTF8String], [set countForObject:obj]);
        }
        printf("\n");
        
    }
    return 0;
}
