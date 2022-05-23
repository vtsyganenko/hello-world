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
        [clc setValue1: v1];

        NSLog (@"Input action character:");
        scanf(" %c", &action);
        [clc setActionChar: action];

        NSLog (@"Input value 2:");
        scanf("%f", &v2);
        [clc setValue2: v2];
        
        // print result
        // value 1 is taken from synthesized getter
        // action is taken from written getter
        // value 2 is taken by dot operator
        NSLog (@"%g %c %g = %g", [clc value1], [clc getActionChar], clc.value2, [clc calc]);
    }
    return 0;
}
