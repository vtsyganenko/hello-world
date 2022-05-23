#ifndef CALC_H
#define CALC_H

#import <Foundation/Foundation.h>

@interface Calc : NSObject
// don't create setter for these values
// setters and getters for both values are generated
@property float value1;
@property float value2;

-(void) setActionChar: (char) c;
-(char) getActionChar;
-(float) calc;
@end

#endif