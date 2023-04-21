//
//  Calc.m
//  Calculator
//
//  Created by Виталий Цыганенко on 15/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import "Calc.h"

@implementation Calc
{
    double result;
}

@synthesize firstOperand;
@synthesize action;
@synthesize secondOperand;

- (double) calculate
{
    switch (action) {
        case ADDITION:
            result = firstOperand + secondOperand;
            break;
        case SUBTRACTION:
            result = firstOperand - secondOperand;
            break;
        case MULTIPLICATION:
            result = firstOperand * secondOperand;
            break;
        case DIVISION:
            result = firstOperand / secondOperand;
            break;
        default:
            break;
    }
    NSLog(@"[Calc] %f %@ %f = %f", firstOperand, [ActionHelper actionToString:action],
          secondOperand, result);
    return result;
}

- (double) lastResult {
    return result;
}

- (void) drop
{
    firstOperand = 0.0;
    secondOperand = 0.0;
    result = 0.0;
}

@end
