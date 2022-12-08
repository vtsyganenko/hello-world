#import <Foundation/Foundation.h>

@interface Calc : NSObject
{
	double value1;
	double value2;
}

-(void) setOperand1: (double) value;
-(void) setOperand2: (double) value;
-(void) print;

@end
