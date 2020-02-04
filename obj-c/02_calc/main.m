#import <Foundation/Foundation.h>

#import "calc.h"

int main(int argc, const char* argv[])
{
    @autoreleasepool
    {    
        float v1 = 0.0;
        float v2 = 0.0;
        char action = 0;
        Calc* clc = [[Calc alloc] init];
                
        NSLog (@"Input value 1:");
        scanf("%f", &v1);

        NSLog (@"Input action character:");
        scanf(" %c", &action);

        NSLog (@"Input value 2:");
        scanf("%f", &v2);
        
        [clc setValue: v1 secondValue: v2];
        [clc setActionChar: action];
        float result = [clc calc];
        NSLog (@"Result is %g", result);
        [clc printLastCalc];
    }
    return 0;
}
