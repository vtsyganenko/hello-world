//
//  CalcController.m
//  Calculator
//
//  Created by Виталий Цыганенко on 15/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CalcController.h"
#import "ViewController.h"
#import "Calc.h"

@implementation CalcController
{
    ViewController* view;
    Calc* calc;
    
    enum CalculationStep {
        INPUT_FIRST_OPERAND,
        SET_OR_CHANGE_ACTION,
        INPUT_SECOND_OPERAND,
        CALCULATED
    };
    enum CalculationStep currentStep;
}

- (id) initWithViewController: (ViewController *) vc
{
    if(self = [super init]) {
        // init
        view = vc;
        calc = [[Calc alloc] init];
        
        [self setCalculationStep:INPUT_FIRST_OPERAND];
    }
    return self;
}

-(void) setCalculationStep: (enum CalculationStep) newStep
{
    NSString* stepString = @"";
    if(newStep == INPUT_FIRST_OPERAND)
        stepString = @"INPUT_FIRST_OPERAND";
    else if(newStep == SET_OR_CHANGE_ACTION)
        stepString = @"SET_OR_CHANGE_ACTION";
    else if(newStep == INPUT_SECOND_OPERAND)
        stepString = @"INPUT_SECOND_OPERAND";
    else if(newStep == CALCULATED)
        stepString = @"CALCULATED";
    NSLog(@"[CalcController] setCalculationStep %@", stepString);
    
    currentStep = newStep;
}

#pragma mark - Calc operations (used by ViewController)

- (void) addNextOperand:(double)value
{
    NSLog(@"[CalcController] addNextOperand %f", value);
    
    if(currentStep == INPUT_FIRST_OPERAND) {
        [calc setFirstOperand: value];
        [view showFirstOperand: [NSString stringWithFormat:@"%g", value]];
        [view clearMain];
    }
    else if(currentStep == INPUT_SECOND_OPERAND) {
        [calc setSecondOperand: value];
        [view showSecondOperand: [NSString stringWithFormat:@"%g", value]];
    }
}

- (void) inputNumbersNotify {
    if(currentStep == SET_OR_CHANGE_ACTION) {
        [self setCalculationStep:INPUT_SECOND_OPERAND];
    }
    else if(currentStep == CALCULATED) {
        [self dropCalculation];
    }
}
/*
- (void) editValueNofify {
    if(currentStep == CALCULATED) {
        [self setCalculationStep:INPUT_FIRST_OPERAND];
    }
}
*/

- (void) removeValueNotify {
    if(currentStep == CALCULATED) {
        [view clearHistory];
        [calc drop];
        [self setCalculationStep:INPUT_FIRST_OPERAND];
    }
}

- (void) removeLastValueNotify {
    if(currentStep == CALCULATED) {
        [self dropCalculation];
    }
    else {
        [view clearMain];
    }
}

- (void) changeSignNotify {
    if(currentStep == CALCULATED) {
        [self setCalculationStep:INPUT_FIRST_OPERAND];
        [view clearHistory];
    }
}

- (void) addAction: (enum Action) action {
    NSLog(@"[CalcController] addAction %@", [ActionHelper actionToString:action]);
    
    switch(currentStep) {
        case INPUT_FIRST_OPERAND:
        {
            [calc setAction: action];
            [view showAction: [ActionHelper actionToString:action]];
            [self setCalculationStep:SET_OR_CHANGE_ACTION];
            break;
        }
        case SET_OR_CHANGE_ACTION:
        {
            [calc setAction: action];
            [view updateAction: [ActionHelper actionToString:action]];
            break;
        }
        case INPUT_SECOND_OPERAND:
        {
            [view clearHistory];
            
            double firstOperand = [calc calculate];
            [calc setFirstOperand: firstOperand];
            [view showFirstOperand: [NSString stringWithFormat:@"%g", firstOperand]];
            
            [calc setAction: action];
            [view showAction: [ActionHelper actionToString:action]];
            
            [view clearMain];
            
            [self setCalculationStep:SET_OR_CHANGE_ACTION];
            break;
        }
        case CALCULATED:
        {
            [view clearHistory];
            
            double firstOperand = [calc lastResult];
            [calc setFirstOperand: firstOperand];
            [view showFirstOperand: [NSString stringWithFormat:@"%g", firstOperand]];
            
            [calc setAction: action];
            [view showAction: [ActionHelper actionToString:action]];
            
            [view clearMain];
            
            [self setCalculationStep:SET_OR_CHANGE_ACTION];
            break;
        }
        default:
            break;
    }
}

- (void) makeCalculation {
    NSLog(@"[CalcController] makeCalculation");
    if(currentStep == INPUT_SECOND_OPERAND) {
        [view showResult: [NSString stringWithFormat:@"%g", [calc calculate]]];
        [self setCalculationStep:CALCULATED];
    }
    else if(currentStep == CALCULATED) {
        // repeat all
        double firstOperand = [calc lastResult];
        [calc setFirstOperand: firstOperand];
        //[view showFirstOperand: [NSString stringWithFormat:@"%g", firstOperand]];
        
        [view showFullCalculationWithFirst: [NSString stringWithFormat:@"%g", firstOperand]
                    action: [ActionHelper actionToString:[calc action]]
                    andSecond: [NSString stringWithFormat:@"%g", [calc secondOperand]]];
        
        [view showResult: [NSString stringWithFormat:@"%g", [calc calculate]]];
    }
}

- (void) dropCalculation {
    NSLog(@"[CalcController] dropCalculation");
    [calc drop];
    [view clearMain];
    [view clearHistory];
    [self setCalculationStep:INPUT_FIRST_OPERAND];
}

@end
