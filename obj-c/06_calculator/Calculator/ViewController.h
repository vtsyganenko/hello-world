//
//  ViewController.h
//  Calculator
//
//  Created by Виталий Цыганенко on 15/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalcController;

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController
// set object for interaction
- (void) setCalcController: (CalcController*) calcCont;

// view's modifiers
- (void) showFirstOperand: (NSString*) str;
- (void) showAction: (NSString*) str;
- (void) showSecondOperand: (NSString*) str;
- (void) clearMain;
- (void) showResult: (NSString*) str;
- (void) clearHistory;
@end

NS_ASSUME_NONNULL_END
