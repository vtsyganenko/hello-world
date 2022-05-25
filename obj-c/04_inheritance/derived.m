#import "derived.h"

@implementation Derived

-(id) init {
    if(self = [super init]) {
        x = 2;
        // y = 22; no access
        z = 22;

        //_coef = 200.2;
        // coef = 200.2;
        [self setCoef: 200.2];
    }
    return self;
}

-(void) hello {
    NSLog(@"Hello from Derived class");
}

@end
