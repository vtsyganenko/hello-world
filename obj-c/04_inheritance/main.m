
#import "based.h"
#import "derived.h"

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Based* obj1 = [[Based alloc] init];
        [obj1 hello];
        [obj1 printData];

        Based* obj2 = [[Derived alloc] init];
        [obj2 hello]; // method from Derived is called
        [obj2 printData];
        
        Based* obj3 = [[Based alloc] init];
        [obj3 hello];
        //obj3.x = 3; no access
        //obj3.y = 33; no access
        obj3.coef = 300.3;
        [obj3 printData];
    }
    return 0;
}
