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
        NSMutableSet* set1 = [NSMutableSet setWithObjects: @"alfa", @"bravo", @"charlie", @"delta", nil];
        [set1 print];

        NSLog(@"set2:");
        NSMutableSet* set2 = [[NSMutableSet alloc] initWithObjects: @"echo", @"foxtrot", @"grass", nil];
        [set2 print];

        // intersectSet modifies sender object

        NSMutableSet* set3 = [NSMutableSet setWithSet: set1];
        [set3 intersectSet: set2];
        NSLog(@"intersect set:");
        [set3 print];

        NSLog(@"remove \"grass\" from set2:");
        [set2 removeObject: @"grass"];
        [set2 print];
        NSLog(@"add \"golf\" to set2:");
        [set2 addObject: @"golf"];
        [set2 print];

        NSLog(@"add \"echo\" to set1:");
        [set1 addObject: @"echo"];
        [set1 print];
        NSLog(@"add \"bravo\" and \"charlie\" to set2:");
        [set2 addObject: @"bravo"];
        [set2 addObject: @"charlie"];
        [set2 print];

        set3 = [NSMutableSet setWithSet: set1];
        [set3 intersectSet: set2];
        NSLog(@"intersect set:");
        [set3 print];

        // unionSet modifies sender object

        NSLog(@"union of set1 and set2:");
        set3 = [NSMutableSet setWithSet: set1];
        [set3 unionSet: set2];
        [set3 print];

        NSLog(@" ");
        NSLog(@"any object from set1 is %@", [set1 anyObject]);
        NSLog(@"any object from set2 is %@", [set2 anyObject]);
        NSLog(@" ");

        NSString* str = [[NSString alloc] initWithString:@"alfa"];
        NSLog(@"set 1:");
        [set1 print];
        NSLog(@"str is \"%@\"", str);
        // both of methods use isEqual
        NSLog(@"containsObject: returns %@", [set1 containsObject:str] ? @"YES" : @"NO");
        NSLog(@"member: returns %@", [set1 member:str] );
        NSLog(@" ");

        NSLog(@"let's make a copy of set1:");
        set3 = [NSMutableSet setWithSet: set1];
        [set3 print];
        NSLog(@"add non-string objects to set:");
        [set3 addObject: @20];
        [set3 addObject: @YES];
        [set3 addObject: @-24.4];
        [set3 print];
        NSLog(@"get only string objects and sort them:");
        NSPredicate* pred = [NSPredicate predicateWithFormat:@"self isKindOfClass: %@", [NSString class]];
        NSSet* filtered = [set3 filteredSetUsingPredicate:pred];
        [filtered print];
        NSArray* arr = [filtered allObjects];
        for(NSString* str in [arr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
            return [obj1 compare:obj2];
        }]) {
            NSLog(@"%@", str);
        }
        NSLog(@" ");

        NSLog(@"create two sets:");
        set1 = [NSMutableSet setWithObjects: @"alfa", @"bravo", @"charlie", @"delta", nil];
        [set1 print];
        set2 = [NSMutableSet setWithObjects: @"alfa", @"charlie", nil];
        [set2 print];
        NSLog(@"is set1 a subset of set2? %@", [set1 isSubsetOfSet: set2] ? @"YES" : @"NO");
        NSLog(@"is set2 a subset of set1? %@", [set2 isSubsetOfSet: set1] ? @"YES" : @"NO");
        NSLog(@"update set2 with two objects:");
        [set2 addObject: @"foxtrot"];
        [set2 addObject: @"uniform"];
        [set2 print];
        NSLog(@"is set1 intersects set2? %@", [set1 intersectsSet: set2] ? @"YES" : @"NO");
        NSLog(@"is set2 intersects set1? %@", [set2 intersectsSet: set1] ? @"YES" : @"NO");
        NSLog(@"remove two objects from set2:");
        [set2 removeObject:@"alfa"];
        [set2 removeObject:@"charlie"];
        [set2 print];
        NSLog(@"is set1 intersects set2? %@", [set1 intersectsSet: set2] ? @"YES" : @"NO");
        NSLog(@"is set2 intersects set1? %@", [set2 intersectsSet: set1] ? @"YES" : @"NO");
        NSLog(@" ");

        NSLog(@"return sets back:");
        [set1 print];
        set2 = [NSMutableSet setWithObjects: @"alfa", @"charlie", nil];
        [set2 print];
        NSLog(@"set1 - set2 =");
        [set1 minusSet: set2];
        [set1 print];

    }
    return 0;
}
