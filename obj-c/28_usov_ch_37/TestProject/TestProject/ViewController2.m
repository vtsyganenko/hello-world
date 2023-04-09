//
//  ViewController2.m
//  TestProject
//
//  Created by Виталий Цыганенко on 08.04.2023.
//

#import "ViewController2.h"

@interface ViewController2 ()

@property (strong, nonatomic) IBOutlet UITextField* alertTitleTextField;
@property (strong, nonatomic) IBOutlet UITextField* alertMessageTextField;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction) onUnwindAction: (UIStoryboardSegue*) unwindSegue {
    NSLog(@"ViewController2 unwind action");
}

-(IBAction) showAlert {
    
    UIAlertController* alert = [UIAlertController
        alertControllerWithTitle: self.alertTitleTextField.text.length == 0 ? @"Default title" : self.alertTitleTextField.text
        message: self.alertMessageTextField.text.length == 0 ? @"Default message" : self.alertMessageTextField.text
        preferredStyle: UIAlertControllerStyleAlert];
    
    void (^handler1) (UIAlertAction* action) =
        ^(UIAlertAction* action) {
            NSLog(@"alert: button OK is chosen");
    };
    
    void (^handler2) (UIAlertAction* action) =
        ^(UIAlertAction* action) {
            NSLog(@"alert: button %@ is chosen", [action title]);
    };
    
    UIAlertAction* buttonOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:handler1];
    UIAlertAction* buttonCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:handler2];
    UIAlertAction* buttonDel = [UIAlertAction actionWithTitle:@"Del" style:UIAlertActionStyleDestructive
                                                      handler: ^(UIAlertAction* action) {
        NSLog(@"alert: button %@ is chosen", [action title]);
    }];
    
    [alert addAction:buttonOK];
    [alert addAction:buttonCancel];
    [alert addAction:buttonDel];
    
    [self presentViewController:alert animated:YES completion:^(void){NSLog(@"alert is shown");}];
}

- (IBAction)onTapGesture:(id)sender {
    [self.alertTitleTextField resignFirstResponder];
    [self.alertMessageTextField resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
