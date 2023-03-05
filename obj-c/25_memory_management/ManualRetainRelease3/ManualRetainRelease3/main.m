//
//  main.m
//  ManualRetainRelease3
//
//  Created by Виталий Цыганенко on 05.03.2023.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject
-(instancetype) initWithValue: (int) value;
@end

@implementation MyClass
{
    int value_;
}

-(instancetype) initWithValue: (int) value {
    if(self = [super init]) {
        value_ = value;
    }
    return self;
}

-(void) dealloc {
    NSLog(@"dealloc object with value %d", value_);
    [super dealloc];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // ARC IS TURNED OFF
        
        MyClass* obj1 = [[MyClass alloc] initWithValue:1];
        
        MyClass* obj2 = [[MyClass alloc] initWithValue:2];
        [obj2 autorelease];
        
        // obj2 is autoreleased when pool is drained
        // obj1 should be released manyally
        [obj1 release];
        
        NSLog(@"finish");
    }
    return 0;
}
