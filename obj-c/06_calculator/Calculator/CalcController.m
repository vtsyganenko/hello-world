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
    
    enum OperandOrder {FIRST, SECOND};
    enum OperandOrder order;
}

- (id) initWithViewController: (ViewController *) vc
{
    if(self = [super init]) {
        // init
        view = vc;
        calc = [[Calc alloc] init];
        
        order = FIRST;
    }
    return self;
}

#pragma mark - Calc operation (used by ViewController)

- (void) addNextOperandString:(double)value
{
    NSLog(@"add next operand %f", value);
    
    if(order == FIRST) {
        [calc setFirstOperand: value];
        [view showFirstOperand: [NSString stringWithFormat:@"%g", value]];
        [view clearMain];
    }
    else if(order == SECOND) {
        [calc setSecondOperand: value];
        [view showSecondOperand: [NSString stringWithFormat:@"%g", value]];
    }
}

- (void) addAction: (enum Action) action {
    NSLog(@"addAction %i", action);
    
    if(order == FIRST) {
        [calc setAction: action];
        [view showAction: [ActionHelper actionToString:action]];
        order = SECOND;
    }
    else if(order == SECOND) {
        double firstOperand = [calc lastResult];
        [calc setFirstOperand: firstOperand];
        [view showFirstOperand: [NSString stringWithFormat:@"%g", firstOperand]];
        
        [calc setAction: action];
        [view showAction: [ActionHelper actionToString:action]];
        
        [view showSecondOperand: @""];
        [view clearMain];
        
        order = SECOND;
    }
}

- (void) makeCalculation {
    if(order == SECOND) {
        double res = [calc calc];
        NSLog(@"res is %f", res);
        [view showResult: [NSString stringWithFormat:@"%g", res]];
        //order = FIRST;
    }
}

- (void) dropCalculation {
    if(order == FIRST) {
        [view clearMain];
    }
    else if(order == SECOND) {
        [view clearMain];
        [view clearHistory];
        order = FIRST;
    }
}

@end
