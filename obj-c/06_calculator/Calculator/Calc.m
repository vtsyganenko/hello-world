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
        //order = FIRST;
    }
    return self;
}

- (void) setFirstOperand: (double) value
{
    firstOperand = value;
}

- (double) firstOperand {
    return firstOperand;
}

- (void) setAction: (enum Action) action
{
    self->currentAction = action;
}

- (void) setSecondOperand: (double) value
{
    secondOperand = value;
}

- (double) calc
{
    NSLog(@"Calc: %f %f", firstOperand, secondOperand);
    //result = 0.0;
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

@end
