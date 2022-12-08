#import "calc.h"

// class extension - private methods
@interface Calc ()
-(void) logOperand: (double) value;
@end

@implementation Calc
{
	int value3;
}

-(void) setOperand1: (double) value {
	[self logOperand:value];
	value1 = value;
}

-(void) setOperand2: (double) value {
	[self logOperand:value];
	value2 = value;
}

-(void) print {
	NSLog(@"Calc: value 1 is %g value 2 is %g", value1, value2);
}

-(void) logOperand: (double) value {
	NSLog(@"operand is %g", value);
}

@end
