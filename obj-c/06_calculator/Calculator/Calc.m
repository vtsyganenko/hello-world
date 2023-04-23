//
//  Calc.m
//  Calculator
//
//  Created by Виталий Цыганенко on 15/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import "Calc.h"

#import <math.h>

@implementation Calc
{
    double lastResult;
    BOOL isGoodResult;
}

@synthesize firstOperand;
@synthesize action;
@synthesize secondOperand;

- (id) init {
    if(self = [super init]) {
        isGoodResult = YES;
    }
    return self;
}

- (BOOL) calculate: (double*) result
{
    double res = 0.0;
    isGoodResult = YES;
    
    switch (action) {
        case ADDITION:
            res = firstOperand + secondOperand;
            break;
        case SUBTRACTION:
            res = firstOperand - secondOperand;
            break;
        case MULTIPLICATION:
            res = firstOperand * secondOperand;
            break;
        case DIVISION:
            res = firstOperand / secondOperand;
            break;
        default:
            break;
    }
    NSLog(@"[Calc] %f %@ %f = %f", firstOperand, [ActionHelper actionToString:action],
          secondOperand, res);
    
    if(res == INFINITY || res == -INFINITY || isnan(res)) {
        isGoodResult = NO;
        lastResult = 0.0;
    }
    if(result) {
        *result = res;
        lastResult = res;
    }
    return isGoodResult;
}

- (double) lastResult {
    return lastResult;
}

- (void) drop
{
    firstOperand = 0.0;
    secondOperand = 0.0;
    lastResult = 0.0;
    isGoodResult = YES;
}

@end
