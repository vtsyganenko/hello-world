#import "myclass.h"

@implementation MyClass

-(void) method1 {
    NSLog(@"MyClass::method1");
    NSArray *array = [NSArray array];
    [array objectAtIndex: 0];
}

-(void) method2 {
    NSLog(@"MyClass::method2");
    @throw [[MyException alloc] initWithName:@"MyExceptionName" reason:@"Test" userInfo:nil];
}

@end
