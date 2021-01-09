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
    
    enum CalculationStep {FIRST_OPERAND, SET_ACTION, SECOND_OPERAND, CALCULATED};
    enum CalculationStep step;
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
    
    step = newStep;
}

#pragma mark - Calc operations (used by ViewController)

- (void) addNextOperand:(double)value
{
    NSLog(@"[CalcController] addNextOperand %f", value);
    
    if(step == FIRST_OPERAND) {
        NSLog(@"first operand");
        [calc setFirstOperand: value];
        [view showFirstOperand: [NSString stringWithFormat:@"%g", value]];
        [view clearMain];
    }
    else if(step == SECOND_OPERAND) {
        NSLog(@"second operand");
        [calc setSecondOperand: value];
        [view showSecondOperand: [NSString stringWithFormat:@"%g", value]];
    }
}

- (void) inputNumbersNotify {
    if(step == SET_ACTION) {
        [self setCalculationStep:SECOND_OPERAND];
    }
    else if(step == CALCULATED) {
        [self dropCalculation];
    }
}

- (void) addAction: (enum Action) action {
    NSLog(@"[CalcController] addAction %@", [ActionHelper actionToString:action]);
    
    if(step == FIRST_OPERAND) {
        [calc setAction: action];
        [view showAction: [ActionHelper actionToString:action]];
        [self setCalculationStep:SET_ACTION];
    }
    else if(step == SET_ACTION) {
        [calc setAction: action];
        [view showAction: [ActionHelper actionToString:action]];
    }
    else if(step == SECOND_OPERAND) {
        double firstOperand = [calc calc];
        [calc setFirstOperand: firstOperand];
        [view showFirstOperand: [NSString stringWithFormat:@"%g", firstOperand]];
        
        [calc setAction: action];
        [view showAction: [ActionHelper actionToString:action]];
        
        [view showSecondOperand: @""];
        [view clearMain];
        
        [self setCalculationStep:SET_ACTION];
    }
    else if(step == CALCULATED) {
        double firstOperand = [calc lastResult];
        [calc setFirstOperand: firstOperand];
        [view showFirstOperand: [NSString stringWithFormat:@"%g", firstOperand]];
        
        [calc setAction: action];
        [view showAction: [ActionHelper actionToString:action]];
        
        [view showSecondOperand: @""];
        [view clearMain];
        
        [self setCalculationStep:SET_ACTION];
    }
}

- (void) makeCalculation {
    NSLog(@"[CalcController] makeCalculation");
    if(step == SECOND_OPERAND) {
        [view showResult: [NSString stringWithFormat:@"%g", [calc calc]]];
        [self setCalculationStep:CALCULATED];
    }
    else if(step == CALCULATED) {
        // repeat all
        double firstOperand = [calc lastResult];
        [calc setFirstOperand: firstOperand];
        [view showFirstOperand: [NSString stringWithFormat:@"%g", firstOperand]];
        
        [view showResult: [NSString stringWithFormat:@"%g", [calc calc]]];
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
