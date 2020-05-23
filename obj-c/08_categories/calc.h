#import <Foundation/Foundation.h>

@interface Calc : NSObject
{
	double value1;
	double value2;
}

-(void) setValue1: (double) value;
-(void) setValue2: (double) value;
-(void) print;

@end
