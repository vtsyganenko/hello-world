//
//  MyClass.h
//  NSCopyingProtocol
//
//  Created by Виталий Цыганенко on 14.03.2023.
//

#ifndef MyClass_h
#define MyClass_h

@interface MyClass : NSObject <NSCopying, NSMutableCopying>
{
    double doubleValue;
}

@property (nonatomic, strong, readonly) NSMutableString* stringValue;

-(instancetype) initWithIntegerValue: (int) integerVal
                         doubleValue: (double) doubleVal
                         stringValue: (NSMutableString*) stringVal;

@end

//---------------------------------------------------------------------

@interface MyMutableClass : MyClass

@property (nonatomic, strong, readwrite) NSMutableString* stringValue;

-(void) setIntegerValue: (int) integerVal;
-(void) setDoubleValue: (double) doubleVal;

@end

#endif /* MyClass_h */
