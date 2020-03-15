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

- (void) drop;

- (void) setFirstOperand: (double) value;
- (void) setAction: (enum Action) action;
- (void) setSecondOperand: (double) value;

- (double) calc;
- (double) lastResult;

@end

#endif /* Calc_h */
