#import <Foundation/Foundation.h>

// expand NSSet with Printing category
@interface NSSet (Printing)
-(void) print;
@end

@implementation NSSet (Printing)
-(void) print {
    printf("{ ");
    for(id obj in self) {
        printf("%s ", [[obj description] UTF8String]);
    }
    printf("} \n");
}
@end

int main(int argc, const char* argv[]) {
    @autoreleasepool {

        NSLog(@"set1:");
        NSSet* set1 = [NSSet setWithObjects: @"alfa", @"bravo", @"charlie", @"delta", nil];
        [set1 print];

        NSLog(@"set2:");
        NSSet* set2 = [[NSSet alloc] initWithObjects: @10, @23.3, @92, @0.4, @-20, nil];
        NSLog(@"%@", set2);

        NSLog(@"set3:");
        NSArray* arr = @[ @120, @"Hello", @YES ];
        NSSet* set3 = [NSSet setWithArray: arr];
        NSLog(@"%@", set3);

        NSLog(@"these sets size: set1 has %lu, set2 has %lu, set3 has %lu", [set1 count], [set2 count], [set3 count]);

        NSLog(@"set4:");
        // this method retains objects, it possible to use initWithSet:CopyItems: to copy them
        NSSet* set4 = [[NSSet alloc] initWithSet: set1];
        [set4 print];
        if([set1 isEqualToSet: set4]) {
            NSLog(@"set1 is equal to set4");
        }
        else {
            NSLog(@"set1 is not equal to set4");
        }
        if([set2 isEqualToSet: set4]) {
            NSLog(@"set2 is equal to set4");
        }
        else {
            NSLog(@"set2 is not equal to set4");
        }

        if([set3 containsObject: @YES]) {
            NSLog(@"set3 contains \"YES\"");
        }
        else {
            NSLog(@"set3 doesn't contain \"YES\"");
        }
        if([set3 containsObject: @NO]) {
            NSLog(@"set3 contains \"NO\"");
        }
        else {
            NSLog(@"set3 doesn't contain \"NO\"");
        }
        NSLog(@" ");

        NSLog(@"create set5 based on set3:");
        NSMutableArray* arr1 = [NSMutableArray arrayWithArray: arr];
        [arr1 addObject: @0];
        NSSet* set5 = [NSSet setWithArray: arr1];
        [set5 print];
        if([set5 containsObject: @NO]) {
            NSLog(@"set3 contains \"NO\"");
        }
        else {
            NSLog(@"set3 doesn't contain \"NO\"");
        }
        NSLog(@" ");

        NSLog(@"Enumerate set1:");
        NSEnumerator* en = [set1 objectEnumerator];
        id obj;
        while(obj = [en nextObject]) {
            NSLog(@"object in enumerator is \"%@\"", obj);
        }

        NSLog(@"Sorted values from set1:");
        arr = [set1 allObjects];
        for(NSString* str in [arr sortedArrayUsingSelector:@selector(compare:)]) {
            NSLog(@"%@", str);
        }

    }
    return 0;
}
