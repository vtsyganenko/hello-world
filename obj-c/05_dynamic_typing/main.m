#import "object1.h"
#import "object2.h"

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // use for static typing
        Object1* object1 = [[Object1 alloc] init];
        Object2* object2 = [[Object2 alloc] init];
        
        // use for dynamic typing
        id obj1 = object1;
        id obj2 = object2;
        
        // agreed methods
        [obj1 methodOne];
        [obj2 methodOne];
        
        [obj1 methodThree: "hello"];
        [obj2 methodThree: "world"];
        
        // disagreed methods
        [(Object1*)obj1 methodTwo: 22.3];
        [(Object2*)obj2 methodTwo: 44];

        // inconsistency is only different type of object, so ok
        [obj1 methodFour: obj2];
        [obj2 methodFour: obj1];
    }
    return 0;
}
