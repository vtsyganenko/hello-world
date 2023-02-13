#import <Foundation/Foundation.h>

// NSOrderedSet inherits from NSObject (!)

// expand NSOrderedSet with Printing category
@interface NSOrderedSet (Printing)
-(void) print;
@end

@implementation NSOrderedSet (Printing)
-(void) print {
    printf("%lu elements: { ", [self count]);
    [self enumerateObjectsUsingBlock:
    ^void(id object, NSUInteger idx, BOOL* stop) {
        printf("[%lu: %s] ", idx, [[object description] UTF8String]);
    }];
    printf("} \n");
}
@end

int main(int argc, const char* argv[]) {
    @autoreleasepool {

        // creating set from array

        NSArray* array = [NSArray arrayWithObjects: @-2, @100, @0, @23, @-4, @15, @-30, @30, @0, @9, @49, @-2, @200, nil];
        NSLog(@"array with %lu elements:", [array count]);
        NSLog(@"%@", array);

        NSOrderedSet* set1 = [NSOrderedSet orderedSetWithArray: array];
        NSLog(@"set, based on array:");
        [set1 print];

        // creating set from objects passed test

        NSIndexSet* indexes = [set1 indexesOfObjectsPassingTest:
            ^(id obj, NSUInteger idx, BOOL* stop) {
                if([obj integerValue] < 0)
                    return YES;
                return NO;
            }];
        NSLog(@"indexes of objects passed test: %@", indexes);
        NSOrderedSet* set2 = [NSOrderedSet orderedSetWithArray: [set1 objectsAtIndexes: indexes]];
        NSLog(@"set with objects passed test:");
        [set2 print];
        NSLog(@" ");

        // some methods:

        NSLog(@"set1 count: %lu set2 count: %lu", [set1 count], [set2 count]);

        NSLog(@"enumerate in reverse order:");
        [set2 enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:
            ^void(id obj, NSUInteger idx, BOOL* stop) {
                NSLog(@"idx %lu object %@", idx, obj);
            }];
        NSLog(@"does set contains -3? %@", [set2 containsObject:@-3] ? @"YES" : @"NO");
        NSLog(@"does set contains -2? %@", [set2 containsObject:@-2] ? @"YES" : @"NO");
        NSLog(@" ");

        NSLog(@"index for object -4 is %lu", [set2 indexOfObject:@-4]);        
        if([set2 indexOfObject:@100] == NSNotFound) {
            NSLog(@"index for object 100 is not found!");
        }
        NSLog(@" ");
        // regular actions with set are available

        // creating set from array with range
        
        NSLog(@"%@", array);
        NSRange range;
        range.location = 4; // start index
        range.length = [array count] - range.location;
        NSOrderedSet* set3 = [NSOrderedSet orderedSetWithArray: array range: range copyItems: YES];
        NSLog(@"set, based on array with range (location %lu length %lu):", range.location, range.length);
        [set3 print];
        
        // the similar initWith... methods are presented

    }
    return 0;
}
