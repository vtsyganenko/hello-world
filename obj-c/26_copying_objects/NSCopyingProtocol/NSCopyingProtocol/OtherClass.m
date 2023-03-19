//
//  OtherClass.m
//  NSCopyingProtocol
//
//  Created by Виталий Цыганенко on 19.03.2023.
//

#import <Foundation/Foundation.h>

#import "OtherClass.h"

// extension for modifying readonly property with setter
@interface OtherClass ()
@property (nonatomic, strong, readwrite) NSMutableString* stringValue;
@end

@implementation OtherClass
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
    OtherClass* object = [[OtherClass allocWithZone:zone] initWithIntegerValue: integerValue
                                                    doubleValue: doubleValue
                                                    stringValue: [self.stringValue mutableCopy]];
    return object;
}

-(id) mutableCopyWithZone: (NSZone *) zone {
    OtherMutableClass* object = [[OtherMutableClass allocWithZone:zone] initWithIntegerValue: integerValue
                                                                  doubleValue: doubleValue
                                                                  stringValue: [self.stringValue mutableCopy]];
    return object;
}

-(NSString*) description {
    return [NSString stringWithFormat:@"OtherClass: i %d d %f s \"%@\"",
            integerValue, doubleValue, self.stringValue];
}

@end

//---------------------------------------------------------------------

@implementation OtherMutableClass

// for overrided property
@dynamic stringValue;

-(void) setIntegerValue: (int) integerVal {
    integerValue = integerVal;
}

-(void) setDoubleValue: (double) doubleVal {
    doubleValue = doubleVal;
}

-(NSString*) description {
    return [NSString stringWithFormat:@"OtherMutableClass: i %d d %f s \"%@\"",
            integerValue, doubleValue, self.stringValue];
}

@end
