//
//  OtherClass.h
//  NSCopyingProtocol
//
//  Created by Виталий Цыганенко on 19.03.2023.
//

#ifndef OtherClass_h
#define OtherClass_h

@interface OtherClass : NSObject <NSCopying, NSMutableCopying>
{
    double doubleValue;
}

@property (nonatomic, strong, readonly) NSMutableString* stringValue;

-(instancetype) initWithIntegerValue: (int) integerVal
                         doubleValue: (double) doubleVal
                         stringValue: (NSMutableString*) stringVal;

@end

//---------------------------------------------------------------------

@interface OtherMutableClass : OtherClass

@property (nonatomic, strong, readwrite) NSMutableString* stringValue;

-(void) setIntegerValue: (int) integerVal;
-(void) setDoubleValue: (double) doubleVal;

@end

#endif /* OtherClass_h */
