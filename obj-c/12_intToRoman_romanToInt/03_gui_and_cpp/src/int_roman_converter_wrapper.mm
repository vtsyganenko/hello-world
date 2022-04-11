#import "int_roman_converter_wrapper.h"

#include "int_roman_converter.h"

@interface IntRomanConverterWrapper()
@property (nonatomic) IntRomanConverter* object;
@end

@implementation IntRomanConverterWrapper

- (id) init {
    self = [super init];
    if(self) {
        self.object = new IntRomanConverter;
    }
    return self;
}
/*
- (int) romanToInt: (NSString*) romanString {

}

- (NSString*) intToRoman: (int) integerValue {

}
*/
- (BOOL) isCorrectRomanString: (NSString*) romanString {
    // how convert NSString* to const std::string& ?
    //return self.object->isCorrectRomanString(romanString);
    return NO;
}

- (BOOL) isAppropriateIntegerValue: (int) integerValue {
    return self.object->isAppropriateIntegerValue(integerValue);
    //return YES;
}

@end