//
//  main.m
//  CopyingExample
//
//  Created by Виталий Цыганенко on 13.03.2023.
//

#import <Foundation/Foundation.h>

void printStringArray(NSMutableArray* array, NSString* message) {
    printf("%s: ", [message UTF8String]);
    for(NSString* s in array) {
        printf("%s ", [s UTF8String]);
    }
    printf("\n");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray* dataArray1 = [NSMutableArray arrayWithObjects:@"one", @"two", @"three", nil];
        NSMutableArray* dataArray2;
        
        // case 1 - assignment
        
        printf("case1 - assignment:\n");
        printStringArray(dataArray1, @"dataArray1");
        printStringArray(dataArray2, @"dataArray2");
        dataArray2 = dataArray1; // assignment - both pointers reference the same object
        [dataArray2 removeObjectAtIndex:0];
        printStringArray(dataArray1, @"dataArray1");
        printStringArray(dataArray2, @"dataArray2");
        printf("\n");
        
        // case 2 - copying of constant data (immutable strings)
        
        printf("case 2 - copying of constant data (immutable strings):\n");
        dataArray1 = [NSMutableArray arrayWithObjects:@"one", @"two", @"three", nil];
        dataArray2 = nil;
        printStringArray(dataArray1, @"dataArray1");
        printStringArray(dataArray2, @"dataArray2");
        dataArray2 = [dataArray1 mutableCopy];
        [dataArray2 removeObjectAtIndex:0];
        printStringArray(dataArray1, @"dataArray1");
        printStringArray(dataArray2, @"dataArray2");
        printf("\n");
        
        // case 3 - shallow copy
        printf("case3 - shallow copy:\n");
        dataArray1 = [NSMutableArray arrayWithObjects:
            [NSMutableString stringWithString:@"one"],
            [NSMutableString stringWithString:@"two"],
            [NSMutableString stringWithString:@"three"], nil];
        dataArray2 = nil;
        printStringArray(dataArray1, @"dataArray1");
        printStringArray(dataArray2, @"dataArray2");
        dataArray2 = [dataArray1 mutableCopy];
        // modify
        NSMutableString* mstr = dataArray2[0]; // mstr just a new reference to dataArray2 element 0
        [mstr appendString:@"ONE"];
        // modify
        [dataArray2 removeObjectAtIndex:[dataArray2 count] - 1];
        printStringArray(dataArray1, @"dataArray1");
        printStringArray(dataArray2, @"dataArray2");
        printf("\n");
        
        // case 4 - deep copying (self made)
        printf("case4 - deep copying (self made):\n");
        dataArray1 = [NSMutableArray arrayWithObjects:
            [NSMutableString stringWithString:@"one"],
            [NSMutableString stringWithString:@"two"],
            [NSMutableString stringWithString:@"three"], nil];
        dataArray2 = [NSMutableArray array];
        printStringArray(dataArray1, @"dataArray1");
        // self made copying
        for(NSMutableString* ms in dataArray1) {
            [dataArray2 addObject:[ms mutableCopy]];
        }
        printStringArray(dataArray2, @"dataArray2");
        // modify
        mstr = dataArray2[0]; // mstr just a new reference to dataArray2 element 0
        [mstr appendString:@"ONE"];
        // modify
        [dataArray2 removeObjectAtIndex:[dataArray2 count] - 1];
        printStringArray(dataArray1, @"dataArray1");
        printStringArray(dataArray2, @"dataArray2");
        printf("\n");
        
        // case 5 - deep copying (with Archiver)
        printf("case5- deep copying (with Archiver):\n");
        dataArray1 = [NSMutableArray arrayWithObjects:
            [NSMutableString stringWithString:@"one"],
            [NSMutableString stringWithString:@"two"],
            [NSMutableString stringWithString:@"three"], nil];
        dataArray2 = nil;
        mstr = nil;
        printStringArray(dataArray1, @"dataArray1");
        // make a deep copy using the archiver
        
        // code from book example is deprecated for now
        //NSData* data = [NSKeyedArchiver archivedDataWithRootObject: dataArray1];
        //dataArray2 = [NSKeyedUnarchiver unarchiveObjectWithData: data];
        
        NSError* error;
        NSData* data = [NSKeyedArchiver archivedDataWithRootObject:dataArray1 requiringSecureCoding:NO error:&error];
        if(error) {
            NSLog(@"achiving error: %@", error);
        }
        error = nil;
        NSSet<Class>* classes = [NSSet setWithObjects:NSMutableArray.class, NSMutableString.class, nil];
        dataArray2 = [NSKeyedUnarchiver unarchivedObjectOfClasses:classes fromData:data error:&error];
        if(error) {
            NSLog(@"unachiving error: %@", error);
        }
        
        printStringArray(dataArray2, @"dataArray2");
        // modify
        mstr = dataArray2[0]; // mstr just a new reference to dataArray2 element 0
        [mstr appendString:@"ONE"];
        // modify
        [dataArray2 removeObjectAtIndex:[dataArray2 count] - 1];
        printStringArray(dataArray1, @"dataArray1");
        printStringArray(dataArray2, @"dataArray2");
        printf("\n");
        
    }
    return 0;
}
