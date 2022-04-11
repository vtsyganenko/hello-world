#import <Foundation/Foundation.h>

#import "int_roman_converter_wrapper.h"

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        IntRomanConverterWrapper* wrapper = [[IntRomanConverterWrapper alloc] init];
        
        NSLog(@"isAppropriateIntegerValue(0)=%d", [wrapper isAppropriateIntegerValue:0]);
        NSLog(@"isAppropriateIntegerValue(10)=%d", [wrapper isAppropriateIntegerValue:10]);
        NSLog(@"isAppropriateIntegerValue(4000)=%d", [wrapper isAppropriateIntegerValue:4000]);
        NSLog(@"isAppropriateIntegerValue(5000)=%d", [wrapper isAppropriateIntegerValue:5000]);

        //NSLog(@"Hello world!");
    }
    return 0;
}
