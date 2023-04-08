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

@end
