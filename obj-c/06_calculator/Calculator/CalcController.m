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

@interface CalcController()

@property (nonatomic, weak) ViewController* view;
@property (nonatomic, strong) Calc* calc;

enum CalculationStep {
    INPUT_FIRST_OPERAND,
    INPUT_ACTION,
    INPUT_SECOND_OPERAND,
    CALCULATED,
    ERROR_RESULT
};
@end

@implementation CalcController
{
    enum CalculationStep currentStep;
}

@synthesize view;
@synthesize calc;

- (id) initWithViewController: (ViewController *) vc
{
    if(self = [super init]) {
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
    else if(newStep == INPUT_ACTION)
        stepString = @"INPUT_ACTION";
    else if(newStep == INPUT_SECOND_OPERAND)
        stepString = @"INPUT_SECOND_OPERAND";
    else if(newStep == CALCULATED)
        stepString = @"CALCULATED";
    else if(newStep == ERROR_RESULT)
        stepString = @"ERROR_RESULT";
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
    if(currentStep == INPUT_ACTION) {
        [self setCalculationStep:INPUT_SECOND_OPERAND];
    }
    else if(currentStep == CALCULATED) {
        [self dropCalculation];
    }
}

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
        case INPUT_FIRST_OPERAND:   // regular case
        {
            [calc setAction: action];
            [view showAction: [ActionHelper actionToString:action]];
            [self setCalculationStep:INPUT_ACTION];
            break;
        }
        case INPUT_ACTION:      // change action
        {
            [calc setAction: action];
            [view updateAction: [ActionHelper actionToString:action]];
            break;
        }
        case INPUT_SECOND_OPERAND:  // make calculation and use result as first operand
        {
            [view clearHistory];
                        
            double result = 0.0;
            BOOL goodResult = [calc calculate: &result];
            
            if(goodResult) {
                [calc setFirstOperand: result];
                [view showFirstOperand: [NSString stringWithFormat:@"%g", result]];
                
                [calc setAction: action];
                [view showAction: [ActionHelper actionToString:action]];
                
                [view clearMain];
                [self setCalculationStep:INPUT_ACTION];
            }
            else {
                [self setCalculationStep:ERROR_RESULT];
                [view showErrorMessage];
            }
            break;
        }
        case CALCULATED:    // use result as first operand
        {
            [view clearHistory];
            
            double firstOperand = [calc lastResult];
            [calc setFirstOperand: firstOperand];
            [view showFirstOperand: [NSString stringWithFormat:@"%g", firstOperand]];
            
            [calc setAction: action];
            [view showAction: [ActionHelper actionToString:action]];
            
            [view clearMain];
            
            [self setCalculationStep:INPUT_ACTION];
            break;
        }
        default:
            break;
    }
}

- (void) makeCalculation {
    NSLog(@"[CalcController] makeCalculation");
    // regular case
    if(currentStep == INPUT_SECOND_OPERAND) {
        double result = 0.0;
        BOOL goodResult = [calc calculate: &result];
        
        if(goodResult) {
            [view showResult: [NSString stringWithFormat:@"%g", result]];
            [self setCalculationStep:CALCULATED];
        }
        else {
            [self setCalculationStep:ERROR_RESULT];
            [view showErrorMessage];
        }
    }
    else if(currentStep == CALCULATED) { // repeat last calculation with result as first operand
        double firstOperand = [calc lastResult];
        [calc setFirstOperand: firstOperand];
        
        [view showFullCalculationWithFirst: [NSString stringWithFormat:@"%g", firstOperand]
                    action: [ActionHelper actionToString:[calc action]]
                    andSecond: [NSString stringWithFormat:@"%g", [calc secondOperand]]];
        
        double result = 0.0;
        BOOL goodResult = [calc calculate: &result];
        
        if(goodResult) {
            [view showResult: [NSString stringWithFormat:@"%g", result]];
        }
        else {
            [self setCalculationStep:ERROR_RESULT];
            [view showErrorMessage];
        }
    }
}

- (void) dropCalculation {
    NSLog(@"[CalcController] dropCalculation");
    [calc drop];
    [view clearMain];
    [view clearHistory];
    [self setCalculationStep:INPUT_FIRST_OPERAND];
}

- (BOOL) isCalculationAvailable {
    if(currentStep == INPUT_SECOND_OPERAND || currentStep == CALCULATED)
        return YES;
    else
        return NO;
}

@end
