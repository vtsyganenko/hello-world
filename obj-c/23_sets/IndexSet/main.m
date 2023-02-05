#import <Foundation/Foundation.h>

// NSIndexSet inherits from NSObject (!)

// expand NSIndexSet with Printing category
@interface NSIndexSet (Printing)
-(void) print;
@end

@implementation NSIndexSet (Printing)
-(void) print {
    printf("{ ");
    [self enumerateIndexesUsingBlock:
    ^void(NSUInteger idx, BOOL* stop) {
        printf("%lu ", idx);
    }];
    printf("} \n");
}
@end

int main(int argc, const char* argv[]) {
    @autoreleasepool {

        NSArray* array = [NSArray arrayWithObjects: @-2, @100, @0, @23, @-4, @15, @-30, @30, @0, @9, @49, @-2, @200, nil];
        NSLog(@"array: %@", array);

        NSInteger value = 20;
        NSIndexSet* set = [array indexesOfObjectsPassingTest:
            ^(id obj, NSUInteger idx, BOOL* stop) {
                if([obj integerValue] > value) {
                    return YES;
                }
                return NO;
            }];
        NSLog(@"indexes with value that more than %ld is:", value);
        [set print];
        NSLog(@"set contains %lu indexes, first is %lu, last is %lu", [set count], [set firstIndex], [set lastIndex]);
        NSLog(@"according objects:");
        NSArray* objects = [array objectsAtIndexes:set];
        NSLog(@"%@", objects);
        NSLog(@" ");

        NSLog(@"index search for set:");
        [set print];
        NSLog(@"indexLessThanIndex 7 is %lu", [set indexLessThanIndex: 7]);
        NSLog(@"indexLessThanOrEqualToIndex 7 is %lu", [set indexLessThanOrEqualToIndex: 7]);
        NSLog(@"indexGreaterThanIndex 8 is %lu", [set indexGreaterThanIndex: 8]);
        NSLog(@"indexLessThanOrEqualToIndex 10 is %lu", [set indexLessThanOrEqualToIndex: 10]);

    }
    return 0;
}
