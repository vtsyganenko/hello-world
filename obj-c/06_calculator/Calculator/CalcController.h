//
//  CalcController.h
//  Calculator
//
//  Created by Виталий Цыганенко on 15/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#ifndef CalcController_h
#define CalcController_h

#import "Action.h"

@class ViewController;

@interface CalcController : NSObject

- (id) initWithViewController: (ViewController*) vc;

- (void) addNextOperandString: (double) value;
- (void) addAction: (enum Action) action;
- (void) makeCalculation;

- (void) dropCalculation;

@end

#endif /* CalcController_h */
