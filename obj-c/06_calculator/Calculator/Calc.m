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
    NSLog(@"setAction %i", action);
    self->currentAction = action;
}

- (void) setSecondOperand: (double) value
{
    secondOperand = value;
}

- (double) calc
{
    NSLog(@"Calc: %f %f", firstOperand, secondOperand);
    switch (currentAction) {
        case ADD:
            result = firstOperand + secondOperand;
            break;
        case SUB:
            result = firstOperand - secondOperand;
            break;
        default:
            break;
    }
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
