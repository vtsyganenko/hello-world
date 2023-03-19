//
//  MyClass.m
//  NSCopyingProtocol
//
//  Created by Виталий Цыганенко on 14.03.2023.
//

#import <Foundation/Foundation.h>

#import "MyClass.h"

// extension for modifying readonly property with setter
@interface MyClass ()
@property (nonatomic, strong, readwrite) NSMutableString* stringValue;
@end

@implementation MyClass
{
@protected
    int integerValue;
}

@synthesize stringValue;

-(instancetype) initWithIntegerValue: (int) integerVal
                         doubleValue: (double) doubleVal
                         stringValue: (NSMutableString*) stringVal {
    if(self = [super init]) {
        integerValue = integerVal;
        doubleValue = doubleVal;
        self.stringValue = stringVal;
    }
    return self;
}

-(id) copyWithZone: (NSZone *) zone {
    MyClass* object = [[MyClass allocWithZone:zone] initWithIntegerValue: integerValue
                                                    doubleValue: doubleValue
                                                    stringValue: self.stringValue];
    return object;
}

-(id) mutableCopyWithZone: (NSZone *) zone {
    MyMutableClass* object = [[MyMutableClass allocWithZone:zone] initWithIntegerValue: integerValue
                                                                  doubleValue: doubleValue
                                                                  stringValue: self.stringValue];
    return object;
}

-(NSString*) description {
    return [NSString stringWithFormat:@"MyClass: i %d d %f s \"%@\"",
            integerValue, doubleValue, self.stringValue];
}

@end

//---------------------------------------------------------------------

@implementation MyMutableClass

// for overrided property
@dynamic stringValue;

-(void) setIntegerValue: (int) integerVal {
    integerValue = integerVal;
}

-(void) setDoubleValue: (double) doubleVal {
    doubleValue = doubleVal;
}

-(NSString*) description {
    return [NSString stringWithFormat:@"MyMutableClass: i %d d %f s \"%@\"",
            integerValue, doubleValue, self.stringValue];
}

@end
