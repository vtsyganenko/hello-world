#import "calc.h"

@implementation Calc

-(void) setValue1: (double) value {
	value1 = value;
}

-(void) setValue2: (double) value {
	value2 = value;
}

-(void) print {
	NSLog(@"value 1 is %g value 2 is %g", value1, value2);
}

@end
