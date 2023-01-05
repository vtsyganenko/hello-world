#import <Foundation/Foundation.h>

/*
// block example

^(void) {
    NSLog(@"Hello from block!");
}
*/

int main(int argc, const char* argv[]) {
    @autoreleasepool {

        // block is assigned to variable
        // block takes void and returns void
        void (^block) (void) = 
            ^(void) {
                NSLog(@"Hello from block!");
            };
        
        block();

        // block uses external variable "coef" and takes int parameter
        double coef = 22.1;
        void (^calculate) (int) =
            ^(int value) {
                NSLog(@"calculate for value %d is %f", value, value * coef);
            };
        
        calculate(1);
        calculate(2);
        calculate(10);

        // the value of the used variable "coef" is the value it has at the time the block is defined (!)
        coef = 2.0;
        calculate(10);  // block user coef = 22.1 (!)

        // block returns result
        int (^sum) (int, int) =
            ^(int a, int b) {
                return a+b;
            };
        
        NSLog(@"10 + 24 = %d", sum(10,24));

        // modification of variables is prohibited
        int some_value = 23;
        void (^modif) (void) =
            ^(void) {
                int a = some_value; // acces is ok
                // some_value = 32;    // error !
            };

        // if we declare variable with "__ block" modifier:
        __block int block_variable = 100;

        // block can use actual value of this variable
        void (^block_1) (void) =
            ^(void) {
                NSLog(@"block_1 use block_variable %d", block_variable);
            };

        block_variable = 200;
        block_1();

        // block can modify this variable
        void (^block_2) (void) =
            ^(void) {
                block_variable = 300;
            };

        block_2();
        NSLog(@"block_variable after block_2 %d", block_variable);

    }
    return 0;
}
