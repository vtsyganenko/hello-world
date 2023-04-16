//
//  ViewController.m
//  Calculator
//
//  Created by Виталий Цыганенко on 15/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import "ViewController.h"

#import "CalcController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

@property (weak, nonatomic) IBOutlet UILabel *topHistoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleHistoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomHistoryLabel;

@end

@implementation ViewController
{
    CalcController* calcController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.mainLabel.layer.borderColor = [UIColor systemGreenColor].CGColor;
    self.mainLabel.layer.borderWidth = 2.0;
    
    self.topHistoryLabel.text = nil;
    self.middleHistoryLabel.text = nil;
    self.bottomHistoryLabel.text = nil;
    
}

- (void) setCalcController:(CalcController *)calcCont {
    calcController = calcCont;
}

#pragma mark - View's modifiers (used by ViewController user - calcController)

- (void) showFirstOperand: (NSString*) str {
    //NSLog(@"showFirstOperand: %@", str);
    self.bottomHistoryLabel.text = str;
}

- (void) showAction: (NSString*) str {
    //NSLog(@"showAction: %@", str);
    self.middleHistoryLabel.text = self.bottomHistoryLabel.text;
    self.bottomHistoryLabel.text = str;
}

- (void) updateAction: (NSString*) str {
    self.bottomHistoryLabel.text = str;
}

- (void) showSecondOperand: (NSString*) str {
    //NSLog(@"showSecondOperand: %@", str);
    self.topHistoryLabel.text = self.middleHistoryLabel.text;
    self.middleHistoryLabel.text = self.bottomHistoryLabel.text;
    self.bottomHistoryLabel.text = str;
}

- (void) clearMain {
    self.mainLabel.text = @"0";
}

- (void) showResult: (NSString *) str {
    self.mainLabel.text = str;
}

- (void) clearHistory {
    self.topHistoryLabel.text = nil;
    self.middleHistoryLabel.text = nil;
    self.bottomHistoryLabel.text = nil;
}

#pragma mark - UI elements action handlers

- (IBAction) numberButtonHandler: (UIButton*) sender {
    //NSLog(@"[ViewController] Pressed %@ button", sender.titleLabel.text);
    
    [calcController inputNumbersNotify];
    
    // replace "0" by the either number
    if([self.mainLabel.text isEqualToString: @"0"] == YES)
    {
        self.mainLabel.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
    }
    else
    {
        // regular case - just add next number
        self.mainLabel.text = [self.mainLabel.text stringByAppendingString: sender.titleLabel.text];
    }
}

- (IBAction) cButtonHandler {
    [calcController dropCalculation];
}

- (IBAction) backspaceButtonHandler {
    if(self.mainLabel.text) {
        // "0" - do nothing
        if([self.mainLabel.text isEqualToString:@"0"] == YES) {
            return;
        }
        
        // one number - set 0
        if(self.mainLabel.text.length == 1) {
            self.mainLabel.text = @"0";
            //[calcController dropCalculation];
            return;
        }
        
        // minus and one number - set 0
        if(self.mainLabel.text.length == 2) {
            NSString* firstLetter = [self.mainLabel.text substringToIndex:1];
            if([firstLetter isEqualToString:@"-"]) {
                self.mainLabel.text = @"0";
                //[calcController dropCalculation];
                return;
            }
        }
        
        // other cases - remove last character
        NSUInteger newEnd = self.mainLabel.text.length - 1;
        [self showResult: [self.mainLabel.text substringToIndex:newEnd]];
        [self clearHistory];
        [calcController editValueNofify];
    }
}

- (IBAction) actionButtonHandler: (UIButton *)sender {
    enum Action action = (enum Action)sender.tag;
    //NSString* actionString = [ActionHelper actionToString:action];
    
    //NSLog(@"[ViewController] actionButtonHandler (%@)", actionString);
    
    double operand = [self.mainLabel.text doubleValue];
    [calcController addNextOperand: operand];
    
    [calcController addAction: action];
    //[self showAction: actionString];
}

- (IBAction) equalButtonHandler: (UIButton *)sender {
    // get second (next) operand and make calculation
    double operand = [self.mainLabel.text doubleValue];
    //NSLog(@"[ViewController] equalButtonHandler: next operand is %f", operand);

    [calcController addNextOperand: operand];
    [calcController makeCalculation];
}

- (IBAction) dotButtonHandler: (UIButton *)sender {
    if(self.mainLabel.text) {
        if([self.mainLabel.text containsString:@"."] == NO) {
            
            // "" + "." = "0."
            //if([self.mainLabel.text isEqualToString: @""] == YES &&
            //   [sender.titleLabel.text isEqualToString: @"."] == YES)
            //{
            //    self.mainLabel.text = [NSString stringWithFormat:@"0%@",
             //   sender.titleLabel.text];
            //}
            // "0." + "." = "."
            //else if([self.mainLabel.text isEqualToString: @"0."] == YES &&
              //       [sender.titleLabel.text isEqualToString: @"."] == YES)
            //{
                //...
            //}
            
            // add "."
            self.mainLabel.text = [self.mainLabel.text stringByAppendingString: @"."];
        }
    }
}

- (IBAction) signButtonHandler: (id)sender {
    if(self.mainLabel.text) {
        
        // "0" - do nothing
        if([self.mainLabel.text isEqualToString:@"0"] == YES) {
            return;
        }
        
        // change sign of the value
        double value = self.mainLabel.text.doubleValue * -1;
        self.mainLabel.text = [NSString stringWithFormat:@"%g", value];
        
        [calcController changeSignNotify];
    }
}

@end
