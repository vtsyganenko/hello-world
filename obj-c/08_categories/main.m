#import "calc.h"
#import "calc+math.h"
#import "unnecessary.h"

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Calc* obj = [[Calc alloc] init];

        [obj setOperand1: 12.4];
        [obj setOperand2: 44.1];
        [obj print];

        // use methods from "Math" category (regular)
        double sum = [obj addOperands];
        double diff = [obj subOperands];
        NSLog(@"sum is %g diff is %g", sum, diff);

        // use class extension

        // use method from "Unnecessary" category
        [obj sayHello];
        // NSString has it too
        NSString* str = [[NSString alloc] init];
        [str sayHello];
    }
    return 0;
}
