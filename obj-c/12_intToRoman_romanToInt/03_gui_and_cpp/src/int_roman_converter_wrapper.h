#ifndef int_roman_converter_wrapper_h
#define int_roman_converter_wrapper_h

#import <Foundation/Foundation.h>

@interface IntRomanConverterWrapper : NSObject
//- (int) romanToInt: (NSString*) romanString;
//- (NSString*) intToRoman: (int) integerValue;
- (BOOL) isCorrectRomanString: (NSString*) romanString;
- (BOOL) isAppropriateIntegerValue: (int) integerValue;
@end

#endif