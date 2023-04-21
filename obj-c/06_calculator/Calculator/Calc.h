//
//  Calc.h
//  Calculator
//
//  Created by Виталий Цыганенко on 15/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#ifndef Calc_h
#define Calc_h

#import <Foundation/Foundation.h>

#import "Action.h"

@interface Calc : NSObject

@property (nonatomic) double firstOperand;
@property (nonatomic) enum Action action;
@property (nonatomic) double secondOperand;

- (double) calculate;
- (double) lastResult;
- (void) drop;

@end

#endif /* Calc_h */
