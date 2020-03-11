#ifndef OBJECT1_H
#define OBJECT1_H

#import <Foundation/Foundation.h>

@interface Object1 : NSObject

-(void) methodOne;

-(void) methodTwo: (float) data;

-(void) methodThree: (const char*) str;

@end

#endif
