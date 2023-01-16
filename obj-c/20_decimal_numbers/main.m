#import <Foundation/Foundation.h>


int main(int argc, const char* argv[]) {
    @autoreleasepool {

        void (^separator) (void) = 
            ^(void) {
                NSLog(@"\n");
            };

        NSDecimalNumber* a = [[NSDecimalNumber alloc] initWithInt: 10];
        NSLog(@"a = %@", a);

        NSNumber* bn = @30;
        NSDecimalNumber* b = [NSDecimalNumber decimalNumberWithDecimal: [bn decimalValue]];
        NSLog(@"b = %@", b);

        NSDecimalNumber* c = [NSDecimalNumber decimalNumberWithString: @"25.4"];
        NSLog(@"c = %@", c);
        separator();

        // actions

        NSLog(@"a + b = %@", [a decimalNumberByAdding: b]);
        NSLog(@"c - a = %@", [c decimalNumberBySubtracting: a]);
        NSLog(@"a * b = %@", [a decimalNumberByMultiplyingBy: b]);
        NSLog(@"b : a = %@", [b decimalNumberByDividingBy:a]);
        NSLog(@"a ^ 3 = %@", [a decimalNumberByRaisingToPower: 3]);
        NSLog(@"b * 10 ^ 3 = %@", [b decimalNumberByMultiplyingByPowerOf10: 3]);
        separator();

        // actions with specified behavior

        NSLog(@"b : c = %@", [b decimalNumberByDividingBy: c]);
        NSDecimalNumberHandler* behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode: NSRoundUp
            scale: 2
            raiseOnExactness: NO
            raiseOnOverflow: NO
            raiseOnUnderflow: NO
            raiseOnDivideByZero: NO];
        NSLog(@"b : c = %@ (round up, scale 2)", [b decimalNumberByDividingBy: c withBehavior: behavior]);
        behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode: NSRoundPlain
            scale: 3
            raiseOnExactness: NO
            raiseOnOverflow: NO
            raiseOnUnderflow: NO
            raiseOnDivideByZero: NO];
        NSLog(@"b : c = %@ (round plain, scale 3)", [b decimalNumberByDividingBy: c withBehavior: behavior]);
        NSLog(@"b : c = %@ (returned to default behavior)", [b decimalNumberByDividingBy: c 
            withBehavior: (NSDecimalNumberHandler*)[NSDecimalNumber defaultBehavior]]);
        // save default behavior
        NSDecimalNumberHandler* df = (NSDecimalNumberHandler*)[NSDecimalNumber defaultBehavior];
        // set new behavior as default
        behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode: NSRoundDown
            scale: 6
            raiseOnExactness: NO
            raiseOnOverflow: NO
            raiseOnUnderflow: NO
            raiseOnDivideByZero: NO];
        [NSDecimalNumber setDefaultBehavior: behavior];
        NSLog(@"b : c = %@ (default behavior for now is round down, scale 6", [b decimalNumberByDividingBy: c]);
        // return default befavior
        [NSDecimalNumber setDefaultBehavior: df];
        NSLog(@"b : c = %@ (default behavior is returned (scale is %d)", [b decimalNumberByDividingBy: c], 
            [[NSDecimalNumber defaultBehavior] scale]);
        separator();

        // round

        bn = @34.34234;
        b = [[NSDecimalNumber alloc] initWithDecimal: [bn decimalValue]];
        behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundUp 
            scale:2 raiseOnExactness:YES raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
        NSLog(@"value %@ is rounded to %@ with behavior: round up, scale %d", b, 
            [b decimalNumberByRoundingAccordingToBehavior: behavior], behavior.scale);
        
        separator();

        // other type of value creation
        NSDecimalNumber *d = [NSDecimalNumber decimalNumberWithMantissa:3 exponent:2 isNegative:NO];
        NSLog(@"%f",[d doubleValue]);
        NSLog(@"obj-c type for NSDecimalNumber is %s (double)", [d objCType]);
        separator();

        // constants
        NSLog(@"%@ %@ %@", [NSDecimalNumber one], [NSDecimalNumber zero], [NSDecimalNumber notANumber]);
    }
    return 0;
}
