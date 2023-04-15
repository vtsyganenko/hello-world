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
        FIRST_OPERAND,
        SET_ACTION,
        UPDATE_ACTION,
        SECOND_OPERAND,
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
        
        [self setCalculationStep:FIRST_OPERAND];
    }
    return self;
}

-(void) setCalculationStep: (enum CalculationStep) newStep
{
    NSString* stepString = @"";
    if(newStep == FIRST_OPERAND)
        stepString = @"FIRST_OPERAND";
    else if(newStep == SET_ACTION)
        stepString = @"ACTION";
    else if(newStep == SECOND_OPERAND)
        stepString = @"SECOND_OPERAND";
    else if(newStep == CALCULATED)
        stepString = @"CALCULATED";
    NSLog(@"[CalcController] setCalculationStep %@", stepString);
    
    currentStep = newStep;
}

#pragma mark - Calc operations (used by ViewController)

- (void) addNextOperand:(double)value
{
    NSLog(@"[CalcController] addNextOperand %f", value);
    
    if(currentStep == FIRST_OPERAND) {
        NSLog(@"first operand");
        [calc setFirstOperand: value];
        [view showFirstOperand: [NSString stringWithFormat:@"%g", value]];
        [view clearMain];
    }
    else if(currentStep == SECOND_OPERAND) {
        NSLog(@"second operand");
        [calc setSecondOperand: value];
        [view showSecondOperand: [NSString stringWithFormat:@"%g", value]];
    }
}

- (void) inputNumbersNotify {
    if(currentStep == SET_ACTION || currentStep == UPDATE_ACTION) {
        [self setCalculationStep:SECOND_OPERAND];
    }
    else if(currentStep == CALCULATED) {
        [self dropCalculation];
    }
}

- (void) addAction: (enum Action) action {
    NSLog(@"[CalcController] addAction %@", [ActionHelper actionToString:action]);
    
    switch(currentStep) {
        case FIRST_OPERAND:
        {
            [calc setAction: action];
            [view showAction: [ActionHelper actionToString:action]];
            [self setCalculationStep:SET_ACTION];
            break;
        }
        case SET_ACTION:
        {
            [calc setAction: action];
            [view updateAction: [ActionHelper actionToString:action]];
            //[self setCalculationStep:UPDATE_ACTION];
            break;
        }
        //case UPDATE_ACTION:
        //{
        //    [calc setAction: action];
        //    [view updateAction: [ActionHelper actionToString:action]];
       //     break;
        //}
        case SECOND_OPERAND:
        {
            [view clearHistory];
            
            double firstOperand = [calc calculate];
            [calc setFirstOperand: firstOperand];
            [view showFirstOperand: [NSString stringWithFormat:@"%g", firstOperand]];
            
            [calc setAction: action];
            [view showAction: [ActionHelper actionToString:action]];
            
            //[view showSecondOperand: @""];
            [view clearMain];
            
            [self setCalculationStep:SET_ACTION];
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
            
            //[view showSecondOperand: @""];
            [view clearMain];
            
            [self setCalculationStep:SET_ACTION];
            break;
        }
        default:
            break;
    }
}

- (void) makeCalculation {
    NSLog(@"[CalcController] makeCalculation");
    if(currentStep == SECOND_OPERAND) {
        [view showResult: [NSString stringWithFormat:@"%g", [calc calculate]]];
        [self setCalculationStep:CALCULATED];
    }
    else if(currentStep == CALCULATED) {
        // repeat all
        double firstOperand = [calc lastResult];
        [calc setFirstOperand: firstOperand];
        [view showFirstOperand: [NSString stringWithFormat:@"%g", firstOperand]];
        
        [view showResult: [NSString stringWithFormat:@"%g", [calc calculate]]];
    }
}

- (void) dropCalculation {
    NSLog(@"[CalcController] dropCalculation");
    [calc drop];
    [view clearMain];
    [view clearHistory];
    [self setCalculationStep:FIRST_OPERAND];
}

@end
