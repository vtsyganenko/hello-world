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
    enum Action currentAction;
    
    double firstOperand;
    double secondOperand;
    double result;
}

-(id) init
{
    if(self = [super init])
    {
        // initialization
        [self drop];
    }
    return self;
}

- (void) setFirstOperand: (double) value
{
    firstOperand = value;
}

- (void) setAction: (enum Action) action
{
    self->currentAction = action;
}

- (void) setSecondOperand: (double) value
{
    secondOperand = value;
}

- (double) calculate
{
    switch (currentAction) {
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
    NSLog(@"Calc: %f %@ %f = %f", firstOperand, [ActionHelper actionToString:currentAction], secondOperand, result);
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
