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

/*
@property (weak, nonatomic) IBOutlet UIButton *buttonC;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlus;
@property (weak, nonatomic) IBOutlet UIButton *buttonMinus;
@property (weak, nonatomic) IBOutlet UIButton *number0;
@property (weak, nonatomic) IBOutlet UIButton *number1;
@property (weak, nonatomic) IBOutlet UIButton *number2;
@property (weak, nonatomic) IBOutlet UIButton *number3;
@property (weak, nonatomic) IBOutlet UIButton *number4;
@property (weak, nonatomic) IBOutlet UIButton *number5;
@property (weak, nonatomic) IBOutlet UIButton *number6;
@property (weak, nonatomic) IBOutlet UIButton *number7;
@property (weak, nonatomic) IBOutlet UIButton *number8;
@property (weak, nonatomic) IBOutlet UIButton *number9;
@property (weak, nonatomic) IBOutlet UIButton *signPoint;
@property (weak, nonatomic) IBOutlet UIButton *buttonEqual;
*/
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
    
    /*
    self.buttonC.layer.borderWidth = 1.0;
    self.buttonPlus.layer.borderWidth = 1.0;
    self.buttonMinus.layer.borderWidth = 1.0;
    self.number0.layer.borderWidth = 1.0;
    self.number1.layer.borderWidth = 1.0;
    self.number2.layer.borderWidth = 1.0;
    self.number3.layer.borderWidth = 1.0;
    self.number4.layer.borderWidth = 1.0;
    self.number5.layer.borderWidth = 1.0;
    self.number6.layer.borderWidth = 1.0;
    self.number7.layer.borderWidth = 1.0;
    self.number8.layer.borderWidth = 1.0;
    self.number9.layer.borderWidth = 1.0;
    self.signPoint.layer.borderWidth = 1.0;
    self.buttonEqual.layer.borderWidth = 1.0;
     */
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

- (IBAction) NumberHandler: (UIButton*) sender {
    //NSLog(@"[ViewController] Pressed %@ button", sender.titleLabel.text);
    
    [calcController inputNumbersNotify];
    
    // replace "0" by the either number except "."
    if([self.mainLabel.text isEqualToString: @"0"] == YES &&
       [sender.titleLabel.text isEqualToString: @"."] == NO)
    {
        self.mainLabel.text = [NSString stringWithFormat:@"%@",
                               sender.titleLabel.text];
    }
    else
    {
        // "" + "." = "0."
        if([self.mainLabel.text isEqualToString: @""] == YES &&
           [sender.titleLabel.text isEqualToString: @"."] == YES)
        {
            self.mainLabel.text = [NSString stringWithFormat:@"0%@",
            sender.titleLabel.text];
        }
        // "0." + "." = "."
        else if([self.mainLabel.text isEqualToString: @"0."] == YES &&
                 [sender.titleLabel.text isEqualToString: @"."] == YES)
        {
            //...
        }
        else
        {
            self.mainLabel.text = [NSString stringWithFormat:@"%@%@",
                                   self.mainLabel.text,
                                   sender.titleLabel.text];
        }
    }
}

- (IBAction) cButtonHandler {
    [calcController dropCalculation];
}

- (IBAction) backspaceButtonHandler {
    if(self.mainLabel.text) {
        NSUInteger newEnd = self.mainLabel.text.length - 1;
        [self showResult: [self.mainLabel.text substringToIndex:newEnd]];
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

@end
