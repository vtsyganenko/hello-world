//
//  main.m
//  NSCopyingProtocol
//
//  Created by Виталий Цыганенко on 14.03.2023.
//

#import <Foundation/Foundation.h>

#import "MyClass.h"
#import "OtherClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // MyClass & MyMutableClass assign strings while copying (shallow)
        // OtherClass & OtherMutableClass copy strings while copying (deep)
        
        // case 1
        
        NSMutableString* s1 = [NSMutableString stringWithString:@"Source my "];
        NSMutableString* s2 = [NSMutableString stringWithString:@"Source other "];
        
        MyClass* my1 = [[MyClass alloc] initWithIntegerValue:10 doubleValue:22.43 stringValue:s1];
        MyClass* my2 = [my1 copy];
        
        OtherClass* o1 = [[OtherClass alloc] initWithIntegerValue:10 doubleValue:22.43 stringValue:s2];
        OtherClass* o2 = [o1 copy];
        
        NSLog(@"before:");
        NSLog(@"%@", my1);
        NSLog(@"copy %@", my2);
        NSLog(@"%@", o1);
        NSLog(@"copy %@", o2);
        
        [s1 appendString:@"modified"];
        [s2 appendString:@"modified"];
        
        NSLog(@"after modifying:");
        NSLog(@"%@", my1);
        NSLog(@"copy %@", my2);
        NSLog(@"%@", o1);
        NSLog(@"copy %@", o2);
        
        NSLog(@" ");
        
        // case 2
        
        s1 = [NSMutableString stringWithString:@"Hello my "];
        s2 = [NSMutableString stringWithString:@"Hello other "];
        
        my1 = [[MyClass alloc] initWithIntegerValue:31 doubleValue:80.2 stringValue:s1];
        my2 = [my1 copy];
        
        o1 = [[OtherClass alloc] initWithIntegerValue:31 doubleValue:80.2 stringValue:s2];
        o2 = [o1 copy];
        
        NSLog(@"before:");
        NSLog(@"%@", my1);
        NSLog(@"copy %@", my2);
        NSLog(@"%@", o1);
        NSLog(@"copy %@", o2);
        
        [[my1 stringValue] appendString:@"modified"];
        [[o1 stringValue] appendString:@"modified"];
        
        NSLog(@"after modifying:");
        NSLog(@"%@", my1);
        NSLog(@"copy %@", my2);
        NSLog(@"%@", o1);
        NSLog(@"copy %@", o2);
        
        NSLog(@" ");
        
        // case 3
        
        s1 = [NSMutableString stringWithString:@"First my "];
        s2 = [NSMutableString stringWithString:@"First other "];
        
        my1 = [[MyClass alloc] initWithIntegerValue:31 doubleValue:80.2 stringValue:s1];
        MyMutableClass* my3 = [my1 mutableCopy];
        
        o1 = [[OtherClass alloc] initWithIntegerValue:31 doubleValue:80.2 stringValue:s2];
        OtherMutableClass* o3 = [o1 mutableCopy];
        
        NSLog(@"before:");
        NSLog(@"%@", my1);
        NSLog(@"mutable copy %@", my3);
        NSLog(@"%@", o1);
        NSLog(@"mutable copy %@", o3);
        
        // retrieve property ptr and modify value
        NSMutableString* ptr1 = [my1 stringValue];
        [ptr1 appendString:@"modified"];
        NSMutableString* ptr2 = [o1 stringValue];
        [ptr2 appendString:@"modified"];
        
        NSLog(@"after modifying:");
        NSLog(@"%@", my1);
        NSLog(@"mutable copy %@", my3);
        NSLog(@"%@", o1);
        NSLog(@"mutable copy %@", o3);
        
    }
    return 0;
}
