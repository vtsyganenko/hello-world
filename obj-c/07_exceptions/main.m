#import <Foundation/Foundation.h>

#import "myclass.h"

int main(int argc, char * argv[]) 
{
    @autoreleasepool {
        id obj = [[MyClass alloc] init];

        @try {
            [obj method1];
        }
        @catch(NSException* e) {
            NSLog(@"Caught exception with name:");
            NSLog(@"%@", e.name);
            NSLog(@"and reason:");
            NSLog(@"%@", e.reason);
        }
        @finally {
            NSLog(@"print this in any case");
        }
        NSLog(@"MyClass::method1 is finished");

        @try {
            [obj method2];
        }
        @catch(NSException* e) {
            NSLog(@"Caught exception with name:");
            NSLog(@"%@", e.name);
            NSLog(@"and reason:");
            NSLog(@"%@", e.reason);
        }
        @finally {
            NSLog(@"print this in any case");
        }
        NSLog(@"MyClass::method2 is finished");
        
    }
    return 0;
}
