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

@property (weak, nonatomic) IBOutlet UILabel *firstOperandLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondOperandLabel;




@end

@implementation ViewController
{
    CalcController* calcController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.mainLabel.layer.borderColor = [UIColor blueColor].CGColor;
    self.mainLabel.layer.borderWidth = 1.0;
}

- (void) setCalcController:(CalcController *)calcCont {
    NSLog(@"setCalcController %p", calcCont);
    
    if(calcCont == nil) {
        NSLog(@"NIL!!");
    }
    calcController = calcCont;
}

- (void) showFirstOperand: (NSString*) str {
    self.firstOperandLabel.text = str;
}

- (void) showAction: (NSString*) str {
    self.actionLabel.text = str;
}

- (void) showSecondOperand: (NSString*) str {
    self.secondOperandLabel.text = str;
}

- (void) clearMain {
    self.mainLabel.text = @"";
}

- (void) clearHistory {
    self.firstOperandLabel.text = @"";
    self.actionLabel.text = @"";
    self.secondOperandLabel.text = @"";
}

- (void) showResult: (NSString *) str {
    self.mainLabel.text = str;
}

- (IBAction) NumberHandler: (UIButton*) sender {
    NSLog(@"Pressed %@ button", sender.titleLabel.text);
    
    self.mainLabel.text = [NSString stringWithFormat:@"%@%@",
                           self.mainLabel.text,
                           sender.titleLabel.text];
}

- (IBAction) cButtonHandler {
    [calcController dropCalculation];
}

- (enum Action) stringToAction: (NSString*) str {
    if([str isEqualToString: @"+"]) {
        return ADD;
    }
    if([str isEqualToString: @"-"]) {
        return SUB;
    }

    return ADD;
}

- (IBAction) actionButtonHandler: (UIButton *)sender {
    double operand = [self.mainLabel.text doubleValue];
    NSLog(@"operand is %f", operand);
        
    [calcController addNextOperandString: operand];
    [calcController addAction: [self stringToAction: self.actionLabel.text]];
    
}

- (IBAction) equalButtonHandler: (UIButton *)sender {
    double operand = [self.mainLabel.text doubleValue];
    NSLog(@"operand is %f", operand);
        
    [calcController addNextOperandString: operand];
    
    [calcController makeCalculation];
}

@end
