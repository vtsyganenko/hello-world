#import "calc.h"
#import "calcmath.h"
#import "unnecessary.h"

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Calc* obj = [[Calc alloc] init];

        [obj setValue1: 12.4];
        [obj setValue2: 44.1];
        [obj print];

        // use methods from "Math" category
        double sum = [obj addValues];
        double diff = [obj subValues];
        NSLog(@"sum is %g diff is %g", sum, diff);

        // use method from "Unnecessary" category
        [obj sayHello];
        // NSString has it too
        NSString* str = [[NSString alloc] init];
        [str sayHello];
    }
    return 0;
}
