#ifndef OBJECT2_H
#define OBJECT2_H

#import <Foundation/Foundation.h>

@interface Object2 : NSObject

-(void) methodOne;

-(void) methodTwo: (int) data;

-(void) methodThree: (const char*) str;

@end

#endif
