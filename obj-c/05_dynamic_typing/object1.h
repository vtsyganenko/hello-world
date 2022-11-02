#ifndef OBJECT1_H
#define OBJECT1_H

#import <Foundation/Foundation.h>

@class Object2;

@interface Object1 : NSObject

-(NSString*) description;

-(void) methodOne;

-(void) methodTwo: (float) data;

-(void) methodThree: (const char*) str;

-(void) methodFour: (Object2*) obj;

@end

#endif
