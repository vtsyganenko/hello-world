//
//  ViewController.m
//  Calculator
//
//  Created by Виталий Цыганенко on 15/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import "ViewController.h"

#import "CalcController.h"

const int MAX_CHARACTERS_COUNT_FOR_MAIN_LABEL = 11;
NSString* errorMessage = @"ERROR";

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *topHistoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *middleHistoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomHistoryLabel;

@end

@implementation ViewController

@synthesize calcController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.mainLabel.layer.borderColor = [UIColor systemGreenColor].CGColor;
    self.mainLabel.layer.borderWidth = 2.0;
    
    self.topHistoryLabel.text = nil;
    self.middleHistoryLabel.text = nil;
    self.bottomHistoryLabel.text = nil;
}

#pragma mark - View's modifiers (used by ViewController user - calcController)

- (void) showFirstOperand: (NSString*) str {
    self.bottomHistoryLabel.text = str;
}

- (void) showAction: (NSString*) str {
    self.middleHistoryLabel.text = self.bottomHistoryLabel.text;
    self.bottomHistoryLabel.text = str;
}

- (void) updateAction: (NSString*) str {
    self.bottomHistoryLabel.text = str;
}

- (void) showSecondOperand: (NSString*) str {
    self.topHistoryLabel.text = self.middleHistoryLabel.text;
    self.middleHistoryLabel.text = self.bottomHistoryLabel.text;
    self.bottomHistoryLabel.text = str;
}

- (void) showFullCalculationWithFirst: (NSString*) first
                            action: (NSString*) action
                            andSecond: (NSString*) second {
    self.topHistoryLabel.text = first;
    self.middleHistoryLabel.text = action;
    self.bottomHistoryLabel.text = second;
}

- (void) showErrorMessage {
    self.mainLabel.text = errorMessage;
}

- (void) clearMain {
    self.mainLabel.text = @"0";
}

- (void) showResult: (NSString *) str {
    if([str isEqualToString:@"-0"]) {
        self.mainLabel.text = @"0";
    }
    else {
        self.mainLabel.text = str;
    }
}

- (void) clearHistory {
    self.topHistoryLabel.text = nil;
    self.middleHistoryLabel.text = nil;
    self.bottomHistoryLabel.text = nil;
}

#pragma mark - UI elements action handlers

- (IBAction) numberButtonHandler: (UIButton*) sender {
    [self handleErrorCase];
    
    [calcController inputNumbersNotify];
    
    // replace "0" by the either number
    if([self.mainLabel.text isEqualToString: @"0"] == YES)
    {
        self.mainLabel.text = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
    }
    else // regular case - just add next number
    {
        if(self.mainLabel.text.length < MAX_CHARACTERS_COUNT_FOR_MAIN_LABEL) {
            self.mainLabel.text = [self.mainLabel.text stringByAppendingString: sender.titleLabel.text];
        }
    }
}

- (IBAction) cButtonHandler {
    [calcController dropCalculation];
}

- (IBAction) backspaceButtonHandler {
    if(self.mainLabel.text) {
        if([self handleErrorCase] == YES)
            return;
        
        // "0" - do nothing
        if([self.mainLabel.text isEqualToString:@"0"] == YES) {
            return;
        }
        
        // one number - set 0
        if(self.mainLabel.text.length == 1) {
            [calcController removeLastValueNotify];
            return;
        }
        
        // minus and one number - set 0
        if(self.mainLabel.text.length == 2) {
            NSString* firstLetter = [self.mainLabel.text substringToIndex:1];
            if([firstLetter isEqualToString:@"-"]) {
                [calcController removeLastValueNotify];
                return;
            }
        }
        
        // other cases - remove last character
        [calcController removeValueNotify];
        NSUInteger newEnd = self.mainLabel.text.length - 1;
        [self showResult: [self.mainLabel.text substringToIndex:newEnd]];
    }
}

- (IBAction) actionButtonHandler: (UIButton *)sender {
    if([self handleErrorCase] == YES)
        return;
    
    enum Action action = (enum Action)sender.tag;
    
    double operand = [self.mainLabel.text doubleValue];
    [calcController addNextOperand: operand];
    
    [calcController addAction: action];
}

- (IBAction) equalButtonHandler: (UIButton *)sender {
    if([self handleErrorCase] == YES)
        return;
    
    if([calcController isCalculationAvailable] == NO)
        return;
    
    // get second (next) operand and make calculation
    double operand = [self.mainLabel.text doubleValue];

    [calcController addNextOperand: operand];
    [calcController makeCalculation];
}

- (IBAction) dotButtonHandler: (UIButton *)sender {
    if(self.mainLabel.text) {
        [self handleErrorCase];
        
        [calcController inputNumbersNotify];
        
        if([self.mainLabel.text containsString:@"."] == NO) {
            // add "."
            self.mainLabel.text = [self.mainLabel.text stringByAppendingString: @"."];
        }
    }
}

- (IBAction) signButtonHandler: (id)sender {
    if(self.mainLabel.text) {
        if([self handleErrorCase] == YES)
            return;
        
        // "0" - do nothing
        if([self.mainLabel.text isEqualToString:@"0"] == YES) {
            return;
        }
        
        // change sign of the value
        double value = self.mainLabel.text.doubleValue * -1;
        
        // corner case "12."
        unichar last = [self.mainLabel.text characterAtIndex: self.mainLabel.text.length - 1];
        if(last == '.') {
            self.mainLabel.text = [NSString stringWithFormat:@"%g.", value];
        }
        else { // regular case
            self.mainLabel.text = [NSString stringWithFormat:@"%g", value];
        }
        
        [calcController changeSignNotify];
    }
}

- (BOOL) handleErrorCase {
    if([self.mainLabel.text isEqualToString:errorMessage] == YES) {
        [calcController dropCalculation];
        return YES;
    }
    return NO;
}

@end
