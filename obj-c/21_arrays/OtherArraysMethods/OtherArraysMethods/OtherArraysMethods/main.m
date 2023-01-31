//
//  main.m
//  OtherArraysMethods
//
//  Created by Виталий Цыганенко on 31.01.2023.
//

#import <Foundation/Foundation.h>

NSInteger sortInt(NSNumber* left, NSNumber* right, void* context) {
    if(left.intValue < right.intValue)
        return NSOrderedAscending;
    else if(left.intValue == right.intValue)
        return NSOrderedSame;
    else
        return NSOrderedDescending;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        void (^printArray) (NSString* arrayName, NSArray* array) =
        ^(NSString* arrayName, NSArray* array) {
            NSLog(@"%@", arrayName);
            NSString* output = [array componentsJoinedByString: @", "];
            NSLog(@"%@", output);
        };
        
        
        // sorting 1
        NSMutableArray* array = [NSMutableArray arrayWithObjects:@25, @2, @0, @100, @30, nil];
        printArray(@"source array:", array);
        
        /*
         - (void)sortUsingFunction:(NSInteger (*)(ObjectType, ObjectType, void *))compare
                           context:(void *)context;
         */
        [array sortUsingFunction:sortInt context:NULL];
        printArray(@"sorted:", array);
        NSLog(@" ");
        
        
        // sorting 2
        NSArray* immutableArray = [NSArray arrayWithObjects:@25, @2, @0, @100, @30, nil];
        printArray(@"immutable array:", immutableArray);
        
        NSArray* sortedImmutableArray = [immutableArray sortedArrayUsingComparator:
                                         ^NSComparisonResult(id obj1, id obj2) {
            if([obj1 integerValue] < [obj2 integerValue])
                return NSOrderedAscending;
            else if([obj1 integerValue] == [obj2 integerValue])
                return NSOrderedSame;
            else
                return NSOrderedDescending;
        }];
        
        NSLog(@"after sorting:");
        printArray(@"immutable array:", immutableArray);
        printArray(@"sorted copy:", sortedImmutableArray);
        NSLog(@" ");
        
        
        // checking if object in array
        NSLog(@"is 2 in immutable array? %@", [immutableArray containsObject:@2] ? @"YES" : @"NO");
        NSLog(@"is 3 in sorted copy array? %@", [immutableArray containsObject:@3] ? @"YES" : @"NO");
        // get an index
        NSLog(@"25 in immutable array has index %lu", [immutableArray indexOfObject:@25]);
        NSUInteger index = [immutableArray indexOfObject:@200];
        if(index == NSNotFound)
            NSLog(@"200 is not found in immutable array");
        else
            NSLog(@"200 in immutable array has index %lu", index);
        NSLog(@" ");
        
        
        // find object passing test
        array = [NSMutableArray arrayWithObjects:@20, @25.14, @30, @"Hello", @-1, @"World", nil];
        printArray(@"array with different types:", array);
        NSLog(@"let's find a string object...");
        index = [array indexOfObjectPassingTest: ^BOOL(id obj, NSUInteger idx, BOOL* stop) {
            return [obj isKindOfClass:[NSString class]];
        }];
        if(index == NSNotFound)
            NSLog(@"not Found");
        else
            NSLog(@"found object with index %lu object is %@", index,
                  [array objectAtIndex:index]);
        NSLog(@" ");
        
        
        // first and last objects
        NSLog(@"first object of array above is %@", [array firstObject]);
        NSLog(@"last object of array above is %@", [array lastObject]);
        NSLog(@" ");
        
        
        // run block for every object in array
        NSLog(@"for previous array:");
        [array enumerateObjectsUsingBlock: ^void(id obj, NSUInteger idx, BOOL* stop) {
            NSLog(@"object [%lu] has class %@", idx, [obj class]);
        }];
        NSLog(@" ");
        
        
        // arrayWithCapacity or initWithCapacity - only for reserving memory for future elements adding
        array = [NSMutableArray arrayWithCapacity:10];
        NSLog(@"set capacity to 10, but count is %lu", [array count]);
        [array addObject:@25.08];
        [array addObject:@"Hello"];
        [array addObject:@20];
        printArray(@"initial array:", array);
        [array insertObject:@30.03 atIndex:1];
        printArray(@"array after insertion at index 1:", array);
        NSMutableIndexSet* indexes = [NSMutableIndexSet indexSet];
        [indexes addIndex:0];
        [indexes addIndex:[array count]];
        [array insertObjects:@[@"first", @"last"] atIndexes:indexes];
        // "last" is not last due to array change after "first" was inserted
        printArray(@"array after insertion several objects:", array);
        // remove and replace
        [array removeObject:@"first"];
        printArray(@"removed \"first\":", array);
        [array removeObjectAtIndex:3];
        printArray(@"removed object with index 3:", array);
        [array replaceObjectAtIndex:3 withObject:@"World"];
        printArray(@"replaced object with index 3 with \"World\"", array);
        
    }
    return 0;
}
