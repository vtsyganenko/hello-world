#ifndef MYCLASS_H
#define MYCLASS_H

#import <Foundation/Foundation.h>

@interface MyClass : NSObject

@property (readonly) int value1;
@property (readonly) double value2;

-(id) initWithValue1 : (int) val1 andValue2: (double) val2;

-(NSString*) description;

@end


@interface OtherClass : NSObject

@property int value;

@end

#endif // MYCLASS_H
