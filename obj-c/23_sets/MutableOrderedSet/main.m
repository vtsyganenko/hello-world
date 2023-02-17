#import <Foundation/Foundation.h>

// NSOrderedSet inherits from NSObject (!)

// expand NSOrderedSet with Printing category
@interface NSOrderedSet (Printing)
-(void) print: (NSString*) label;
@end

@implementation NSOrderedSet (Printing)
-(void) print: (NSString*) label {
    printf("%s with %lu elements: { ", [label UTF8String], [self count]);
    [self enumerateObjectsUsingBlock:
    ^void(id object, NSUInteger idx, BOOL* stop) {
        printf("[%lu: %s] ", idx, [[object description] UTF8String]);
    }];
    printf("} \n");
}
@end

int main(int argc, const char* argv[]) {
    @autoreleasepool {

        // creating sets
        
        NSLog(@"created sets:");
        // init empty set
        NSMutableOrderedSet* set1 = [[NSMutableOrderedSet alloc] init];
        [set1 print:@"set1"];

        // init with reserved memory (but set is empty)
        NSMutableOrderedSet* set2 = [[NSMutableOrderedSet alloc] initWithCapacity:10];
        [set2 print:@"set2"];

        NSArray* array1 = @[@"one", @"two", @"three"];
        NSMutableOrderedSet* set3 = [[NSMutableOrderedSet alloc] initWithArray:array1];
        [set3 print:@"set3"];
        NSLog(@" ");

        // adding
        NSLog(@"adding:");
        
        [set1 addObject:@"hello"];
        [set1 addObject:@"world"];
        [set1 print:@"set1"];
        
        [set2 addObject:@100];
        id array2[] = { @10, @23, @-4, @34, @0, @-4, @5 };
        [set2 addObjects:array2 count:4];
        [set2 print:@"set2"];

        NSArray* array3 = @[@"four", @"five"];
        [set3 addObjectsFromArray:array3];
        [set3 print:@"set3"];
        NSLog(@" ");

        // inserting
        NSLog(@"inserting:");

        // insert to the end
        [set1 insertObject:@"from" atIndex:[set1 count]];
        [set1 insertObject:@"1" atIndex:0];
        [set1 print:@"set1"];

        // insert 3 elements from array4 to position with indexes from indexSet
        NSArray* array4 = @[@100, @200, @300];
        NSMutableIndexSet* indexes = [[NSMutableIndexSet alloc] init];
        [indexes addIndex:1];
        [indexes addIndex:3];
        [indexes addIndex:5];
        [set2 insertObjects:array4 atIndexes:indexes];
        [set2 print:@"set2"];

        [set3 setObject:@"1" atIndexedSubscript:0];
        [set3 setObject:@"4" atIndexedSubscript:3];
        [set3 print:@"set3"];
        NSLog(@" ");

        // remove
        NSLog(@"removing:");

        [set1 removeObject:@"1"];
        [set1 print:@"set1"];

        indexes = [[NSMutableIndexSet alloc] init];
        [indexes addIndex:0];
        [indexes addIndex:3];
        [indexes addIndex:5];
        [set2 removeObjectsAtIndexes:indexes];
        [set2 print:@"set2"];

        [set3 removeObjectsInArray:@[@"1", @"4"]];
        [set3 print:@"set3"];
        NSLog(@" ");

        // replace
        NSLog(@"replacing:");

        [set1 replaceObjectAtIndex:1 withObject:@"friends"];
        [set1 print:@"set1"];
        @try {
            [set1 replaceObjectAtIndex: [set1 count] withObject:@"me!"];
        }
        @catch(NSException* e) {
            NSLog(@"Caught exception with name:");
            NSLog(@"%@", e.name);
            NSLog(@"and reason:");
            NSLog(@"%@", e.reason);
        }

        // append or replace
        NSLog(@"method \"setObject:atIndex:\" apends or replaces:");

        // replace in this case 
        [set2 setObject:@25 atIndex:2];
        [set2 print:@"set2"];
        // no action since @25 already in set
        [set2 setObject:@25 atIndex:[set2 count]];
        [set2 print:@"set2"];
        // insert since index == length
        [set2 setObject:@100 atIndex:[set2 count]];
        [set2 print:@"set2"];
        @try {
            // index out of bounds!
            [set2 setObject:@200 atIndex:10];
        }
        @catch(NSException* e) {
            NSLog(@"Caught exception with name:");
            NSLog(@"%@", e.name);
            NSLog(@"and reason:");
            NSLog(@"%@", e.reason);
        }
        [set2 print:@"set2"];
        NSLog(@" ");

        // move objects

        NSLog(@"move objects with indexes 1 and 3 to index 3:");
        indexes = [NSMutableIndexSet indexSet];
        [indexes addIndex:1];
        [indexes addIndex:3];
        [set2 moveObjectsAtIndexes:indexes toIndex:3];
        [set2 print:@"set2"];
        NSLog(@" ");

        // sorting

        NSLog(@"before sorting:");
        [set1 print:@"set1"];
        [set2 print:@"set2"];
        [set3 print:@"set3"];

        [set1 sortUsingComparator:
            ^(NSString* s1, NSString* s2) {
                return [s1 compare:s2];
            }];
        
        NSSortDescriptor* sortDescr = [NSSortDescriptor sortDescriptorWithKey:@"integerValue" ascending:YES];
        [set2 sortUsingDescriptors:@[sortDescr]];

        sortDescr = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES comparator:
            ^(id obj1, id obj2) { return [obj1 compare: obj2]; }];
        [set3 sortUsingDescriptors:[NSArray arrayWithObject:sortDescr]];

        NSLog(@"after sorting:");
        [set1 print:@"set1"];
        [set2 print:@"set2"];
        [set3 print:@"set3"];
        NSLog(@" ");

        // combining and recombining entries (intersect/minus/union)

        NSLog(@"UNION");
        NSOrderedSet* orderedSet = [NSOrderedSet orderedSetWithObjects: @"that", @"from", @"me", nil];
        [orderedSet print:@"orderedSet"];
        [set1 print:@"set1"];
        [set1 unionOrderedSet:orderedSet];
        NSLog(@"after [set1 unionOrderedSet:orderedSet]:");
        [set1 print:@"set1"];
        NSLog(@" ");

        NSSet* set = [NSSet setWithObjects:@"one", @"zero", @"eleven", nil];
        NSLog(@"set: %@", set);
        [set3 print:@"set3"];
        [set3 unionSet:set];
        NSLog(@"after [set3 unionSet:set]:");
        [set3 print:@"set3"];
        NSLog(@" ");

        NSLog(@"MINUS");
        orderedSet = [NSOrderedSet orderedSetWithObjects: @30, @40, @50, @60, nil];
        [orderedSet print:@"orderedSet"];
        set1 = [NSMutableOrderedSet orderedSetWithObjects: @10, @20, @30, @40, nil];
        [set1 print:@"set1"];
        NSLog(@"after [set1 minusOrderedSet:orderedSet]");
        [set1 minusOrderedSet:orderedSet];
        [set1 print:@"set1"];
        NSLog(@" ");

        NSLog(@"INTERSECT");
        orderedSet = [NSOrderedSet orderedSetWithObjects: @30, @40, @50, @60, nil];
        [orderedSet print:@"orderedSet"];
        set1 = [NSMutableOrderedSet orderedSetWithObjects: @10, @20, @30, @40, nil];
        [set1 print:@"set1"];
        NSLog(@"after [set1 intersectOrderedSet:orderedSet]");
        [set1 intersectOrderedSet:orderedSet];
        [set1 print:@"set1"];
        NSLog(@" ");

    }
    return 0;
}
