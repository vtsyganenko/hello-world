//
//  ViewController.m
//  TestProject
//
//  Created by Виталий Цыганенко on 08.04.2023.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField* textField;
@property (strong, nonatomic) IBOutlet UILabel* label;

@property (strong, nonatomic) IBOutlet UILabel *myLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction) onUnwindAction: (UIStoryboardSegue*) unwindSegue {
    NSLog(@"ViewController unwind action");
}

-(IBAction) textToLog {
    NSLog(@"%@", self.textField.text);
}

-(IBAction) textToLabel {
    self.label.text = self.textField.text;
}

- (IBAction)onTapGesture:(id)sender {
    [self.textField resignFirstResponder];
}

- (IBAction)changeLabelText:(UIButton *)sender {
    if(sender.titleLabel && sender.titleLabel.text) {
        NSString* buttonText = sender.titleLabel.text;
        [self.myLabel setText:buttonText];
        NSLog(@"%@ button was pressed", buttonText);
    }
}


@end
