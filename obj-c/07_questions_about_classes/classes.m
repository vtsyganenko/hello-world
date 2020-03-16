#import "classes.h"

@implementation ClassA

- (void) method1
{
    
}

@end

@implementation ClassB

- (void) method2: (int) value
{
    NSLog(@"%d", value);
}

+ (void) staticMethod
{

}

@end

@implementation ClassC

- (void) method3: (int) val1 andOther: (int) val2
{
    NSLog(@"%d %d", val1, val2);
}

@end
