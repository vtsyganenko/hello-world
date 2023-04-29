//
//  converter_wrapper.m
//  02_wrapper_test
//
//  Created by Виталий Цыганенко on 28.04.2023.
//

#import "converter_wrapper.h"

#include "int_roman_converter.h"


@interface ConverterWrapper()
@property (nonatomic) IntRomanConverter* converter;
@end

@implementation ConverterWrapper

-(id) init {
    if(self = [super init]) {
        self.converter = new IntRomanConverter;
    }
    return self;
}

-(void) dealloc {
    delete self.converter;
}

-(int) romanToInt: (NSString*) roman {
    return self.converter->romanToInt(std::string([roman UTF8String]));
}

-(NSString*) intToRoman: (int) integer {
    std::string result = self.converter->intToRoman(integer);
    return [NSString stringWithUTF8String:result.c_str()];
}

-(BOOL) isCorrectRomanString: (NSString*) string {
    return self.converter->isCorrectRomanString(std::string([string UTF8String]));
}

-(BOOL) isAppropriateIntegerValue: (int) integer {
    return self.converter->isAppropriateIntegerValue(integer);
}

@end
