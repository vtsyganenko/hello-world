//
//  main.m
//  ManualRetainRelease2
//
//  Created by Виталий Цыганенко on 27.02.2023.
//

#import <Foundation/Foundation.h>


@interface Nested : NSObject
-(instancetype) initWithValue: (NSUInteger) value_;
-(NSString*) description;
@end

@implementation Nested
{
    NSUInteger value;
}

-(instancetype) initWithValue: (NSUInteger) value_ {
    if(self = [super init]) {
        value = value_;
    }
    return self;
}

-(NSString*) description {
    return [NSString stringWithFormat:@"\"Nested\" obj with value %lu", value];
}

-(void) dealloc {
    NSLog(@"dealloc \"Nested\" with value %lu", value);
    [super dealloc];
}

@end


@interface MyClass : NSObject
-(NSString*) description;
@end

@implementation MyClass
{
    NSMutableArray* array;
}

-(instancetype) init {
    if(self = [super init]) {
        array = [[NSMutableArray alloc] init];
        for(NSUInteger i=0; i<10; ++i) {
            [array addObject:[[Nested alloc] initWithValue:i+1]];
        }
    }
    return self;
}

-(NSString*) description {
    NSMutableString* str = [NSMutableString string];
    for(NSUInteger i=0; i<[array count]; i++) {
        [str appendFormat:@"%@\n", [array[i] description]];
    }
    return str;
}

-(void) dealloc {
    NSLog(@"MyClass dealloc");
    for(NSUInteger i=0; i<[array count]; i++) {
        // array[i] has retainCount = 2
        // alloc/init increments counter
        // NSMutableArray addObject: increments counter
        [array[i] release];
    }
    [array removeAllObjects]; // decrements counters for every object
    [array release];
    [super dealloc];
}

@end


int main(int argc, const char * argv[]) {
        
    MyClass* obj = [[MyClass alloc] init];
    NSLog(@"print MyClass:\n%@", obj);
    
    NSLog(@"before MyClass release");
    [obj release];
    NSLog(@"after MyClass release");
    
    return 0;
}
