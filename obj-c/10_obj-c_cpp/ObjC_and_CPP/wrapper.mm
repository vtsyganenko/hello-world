//
//  wrapper.m
//  ObjC_and_CPP
//
//  Created by Виталий Цыганенко on 04.12.2021.
//

#import "wrapper.h"

#include "cpp_class.h"

@interface WrapperStringGetter()
@property (nonatomic) StringGetter* getter;
@end

@implementation WrapperStringGetter

- (id)init {
    self = [super init];
    self.getter = new StringGetter;
    return self;
}

- (void)dealloc {
    delete self.getter;
}

- (void) addValue:(int)value {
    self.getter->addValue(value);
}

- (void) clearValues {
    self.getter->clearValues();
}

- (NSString* )getResult {
    std::string cppResult = self.getter->getResult();
    NSString* result = [[NSString alloc] initWithUTF8String:cppResult.c_str()];
    return result;
}

@end
