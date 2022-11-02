#ifndef OBJECT2_H
#define OBJECT2_H

#import <Foundation/Foundation.h>

@class Object1;

@interface Object2 : NSObject

-(NSString*) description;

-(void) methodOne;

-(void) methodTwo: (int) data;

-(void) methodThree: (const char*) str;

-(void) methodFour: (Object1*) obj;

@end

#endif
