#ifndef CLASSES_H
#define CLASSES_H

#import <Foundation/Foundation.h>

@interface A : NSObject
@property int value;
-(void) print;
@end

@interface B : A
-(void) print;
@end

@interface C : B
-(void) print;
@end


#endif // CLASSES_H
