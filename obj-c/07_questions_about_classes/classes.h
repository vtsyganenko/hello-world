#ifndef CLASSES_H
#define CLASSES_H

#import <Foundation/Foundation.h>

@interface ClassA : NSObject

- (void) method1;

@end

@interface ClassB : ClassA

- (void) method2: (int) value;
+ (void) staticMethod;

@end

@interface ClassC : NSObject

- (void) method3: (int) val1 andOther: (int) val2;

@end

#endif // CLASSES_H
