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

        NSArray* array = [NSArray arrayWithObjects: @-2, @100, @0, @23, @-4, @15, @-30, @30, @0, @9, @49, @-2, @200, nil];
        NSLog(@"array with %lu elements:", [array count]);
        NSLog(@"%@", array);

        NSOrderedSet* set1 = [NSOrderedSet orderedSetWithArray: array];
        NSLog(@"set, based on array:");
        [set1 print];

        NSIndexSet* indexes = [set1 indexesOfObjectsPassingTest:
            ^(id obj, NSUInteger idx, BOOL* stop) {
                if([obj integerValue] < 0)
                    return YES;
                return NO;
            }];
        NSLog(@"indexes: %@", indexes);
        NSOrderedSet* set2 = [NSOrderedSet orderedSetWithArray: [set1 objectsAtIndexes: indexes]];
        [set2 print];

        NSLog(@"enumerate in reverse order:");
        [set2 enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:
            ^void(id obj, NSUInteger idx, BOOL* stop) {
                NSLog(@"idx %lu object %@", idx, obj);
            }];
        NSLog(@" ");

        NSLog(@"index for object -4 is %lu", [set2 indexOfObject:@-4]);        
        if([set2 indexOfObject:@100] == NSNotFound) {
            NSLog(@"index for object 100 is not found!");
        }


    }
    return 0;
}
