#import "myclass.h"

@implementation MyClass

@synthesize value1;
@synthesize value2;

-(id) initWithValue1 : (int) val1 andValue2: (double) val2 {
    if(self = [super init]) {
        value1 = val1;
        value2 = val2;
    }
    return self;
}

-(NSString*) description {
    return [NSString stringWithFormat: @"value1: %d value2: %f", value1, value2];
}

@end


@implementation OtherClass

@synthesize value;

@end