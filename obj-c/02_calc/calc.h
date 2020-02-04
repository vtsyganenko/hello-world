#import <Foundation/Foundation.h>

@interface Calc : NSObject
-(void) setValue: (float) value1 secondValue: (float) value2;
-(void) setActionChar: (char) c;
-(float) calc;
-(void) printLastCalc;
@end
