//
//  main.m
//  ManualRetainRelease
//
//  Created by Виталий Цыганенко on 27.02.2023.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject
-(void) sampleMethod;
@end

@implementation MyClass

-(void) sampleMethod {
    NSLog(@"sampleMethod is called");
}

-(void) dealloc {
    NSLog(@"dealloc is called");
    [super dealloc];
}

@end

int main(int argc, const char * argv[]) {
    // notes:
    // ARC in settings is turned off
    // autoreleasepool is not needed in this case
    
    MyClass* obj = [[MyClass alloc] init];
    [obj sampleMethod];
    
    NSLog(@"retain count after creation: %lu", [obj retainCount]);
    [obj retain];
    NSLog(@"retain count after manual retain: %lu", [obj retainCount]);
    [obj release];
    NSLog(@"retain count after manual release: %lu", [obj retainCount]);
    
    NSLog(@"call final release, it produce deallocate");
    [obj release];
    NSLog(@"object released");
    
    obj = nil;
    return 0;
}
