#import <Foundation/Foundation.h>

// expand NSSet with Printing category
@interface NSSet (Printing)
-(void) print: (NSString*) label;
@end

@implementation NSSet (Printing)
-(void) print: (NSString*) label {
    printf("%s with %lu elements: { ", [label UTF8String], [self count]);
    for(id obj in self) {
        printf("%s ", [[obj description] UTF8String]);
    }
    printf("} \n");
}
@end

// expand NSCountedSet with PrintingWithCounts category
@interface NSCountedSet (PrintingWithCounts)
-(void) printWithCounts: (NSString*) label;
@end

@implementation NSCountedSet (PrintingWithCounts)
-(void) printWithCounts: (NSString*) label {
    printf("%s with %lu elements, object(count): ", [label UTF8String], [self count]);
    for(id object in self) {
        printf("%s(%lu) ", [[object description] UTF8String], [self countForObject:object]);
    }
    printf("\n");
}
@end

int main(int argc, const char* argv[]) {
    @autoreleasepool {

        // creation

        NSCountedSet* set1 = [NSCountedSet set];
        [set1 print:@"set1"];
        // add some values
        [set1 addObject:@"one"];
        [set1 addObject:@"two"];
        [set1 addObject:@"two"];
        [set1 addObject:@"three"];
        [set1 print:@"set1"];

        NSArray* array = [NSArray arrayWithObjects: @10, @-2, @2, @10, @11, @100, @0, @-1, @-2, nil];
        NSCountedSet* set2 = [[NSCountedSet alloc] initWithArray:array];
        [set2 print:@"set2"];
        NSLog(@" ");

        NSLog(@"print both sets with counts:");
        [set1 printWithCounts:@"set1"];
        [set2 printWithCounts:@"set2"];
        NSLog(@" ");

        // remove some values

        NSLog(@"after removing some elements:");
        [set1 removeObject:@"one"];
        [set1 removeObject:@"two"];
        [set1 printWithCounts:@"set1"];
        [set2 removeObject:@100];
        [set2 removeObject:@-2];
        [set2 printWithCounts:@"set2"];
        // printWithCounths uses count: and countForObject: methods

        // enumerate

        NSLog(@" ");
        NSLog(@"let's enumerate both sets");
        NSLog(@"set1:");
        NSEnumerator* en = [set1 objectEnumerator];
        id obj;
        while(obj = [en nextObject]) {
            NSLog(@"object: %@ count: %lu", obj, [set1 countForObject:obj]);
        }
        NSLog(@"set2:");
        NSArray* values = [[set2 objectEnumerator] allObjects];
        for(NSUInteger i=0; i<[values count]; ++i) 
            printf("%ld ", [values[i] integerValue]);
        printf("\n");
        NSLog(@" ");

        // union
        NSLog(@"\"unionSet:\"");
        set1 = [[NSCountedSet alloc] initWithSet: set2];
        [set1 addObject: @5];
        [set1 addObject: @20];
        [set1 addObject: @510];
        [set1 printWithCounts:@"before set1"];
        [set2 printWithCounts:@"before set2"];
        [set1 unionSet:set2];
        [set1 printWithCounts:@"after set1"];
        NSLog(@" ");
        
        // intersect
        NSLog(@"\"intersectSet:\"");
        set1 = [NSCountedSet setWithArray:[NSArray arrayWithObjects:@10, @10, @10, @11, @12, @13, @13, @14, @15, nil]];
        [set1 printWithCounts:@"before set1"];
        set2 = [NSCountedSet setWithArray:[NSArray arrayWithObjects:@10, @10, @11, @11, @12, @13, @13, @14, nil]];
        [set2 printWithCounts:@"before set2"];
        [set1 intersectSet:set2];
        [set1 printWithCounts:@"after set1"];
        NSLog(@" ");

        NSLog(@"\"minusSet:\"");
        set1 = [NSCountedSet setWithArray:[NSArray arrayWithObjects:@10, @10, @10, @11, @12, @13, @13, @14, @15, nil]];
        [set1 printWithCounts:@"before set1"];
        [set2 printWithCounts:@"before set2"];
        [set1 minusSet:set2];
        [set1 printWithCounts:@"after set1"];

    }
    return 0;
}
