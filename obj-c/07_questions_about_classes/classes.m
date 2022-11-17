#import "classes.h"

@implementation MyClass
{
    int value;
}

-(void) print {
    NSLog(@"MyClass::print");
}

-(void) setValue: (int) val {
    value = val;
}

-(int) getValue {
    return value;
}

@end

@implementation ClassA

-(void) method1 {
    NSLog(@"method1");
}

-(void) methodTakesObject: (MyClass*) obj {
    NSLog(@"methodTakesObject with obj value %d", [obj getValue]);
}

@end

@implementation ClassB

-(void) method2: (int) value {
    NSLog(@"%d", value);
}

+(void) staticMethod {
    NSLog(@"static method");
}

@end

@implementation ClassC

-(void) method3: (int) val1 andOther: (int) val2 {
    NSLog(@"%d %d", val1, val2);
}

-(void) method4 {
	NSLog(@"method4");
}

@end
