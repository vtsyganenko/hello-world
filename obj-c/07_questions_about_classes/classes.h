#ifndef CLASSES_H
#define CLASSES_H

#import <Foundation/Foundation.h>

@interface MyClass : NSObject
-(void) print;
-(void) setValue: (int) val;
-(int) getValue;
@end

@interface ClassA : NSObject
-(void) method1;
-(void) methodTakesObject: (MyClass*) obj;
@end

@interface ClassB : ClassA
-(void) method2: (int) value;
+(void) staticMethod;
@end

@interface ClassC : NSObject
-(void) method3: (int) val1 andOther: (int) val2;
-(void) method4;
@end

#endif // CLASSES_H
