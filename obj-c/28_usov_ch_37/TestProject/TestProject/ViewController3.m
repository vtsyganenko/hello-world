//
//  ViewController3.m
//  TestProject
//
//  Created by Виталий Цыганенко on 09.04.2023.
//

#import "ViewController3.h"

@interface ViewController3 ()

@property (strong, nonatomic) IBOutlet UITextField* ASTitleTextField;
@property (strong, nonatomic) IBOutlet UITextField* ASMessageTextField;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction) showActionSheet {

    UIAlertController* actionSheet = [UIAlertController
        alertControllerWithTitle: self.ASTitleTextField.text.length == 0 ? @"Default title" : self.ASTitleTextField.text
        message: self.ASMessageTextField.text.length == 0 ? @"Default message" : self.ASMessageTextField.text
        preferredStyle: UIAlertControllerStyleActionSheet];
    
    void (^handler) (UIAlertAction* action) =
        ^(UIAlertAction* action) {
            if([action.title isEqualToString:@"OK"]) {
                [self buttonOKChosen];
            }
            else if([action.title isEqualToString:@"Del"]) {
                [self buttonDelChosen];
            }
            else if([action.title isEqualToString:@"Cancel"]) {
                [self buttonCancelChosen];
            }
    };
    
    UIAlertAction* buttonOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:handler];
    UIAlertAction* buttonCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:handler];
    UIAlertAction* buttonDel = [UIAlertAction actionWithTitle:@"Del" style:UIAlertActionStyleDestructive handler: handler];
    
    [actionSheet addAction:buttonOK];
    [actionSheet addAction:buttonCancel];
    [actionSheet addAction:buttonDel];
    
    [self presentViewController:actionSheet animated:YES completion:^(void){NSLog(@"action sheet is shown");}];
    
}

- (IBAction)onTapGesture:(id)sender {
    [self.ASTitleTextField resignFirstResponder];
    [self.ASMessageTextField resignFirstResponder];
}

-(void) buttonOKChosen {
    NSLog(@"button OK is chosen");
}

-(void) buttonDelChosen {
    NSLog(@"button Del is chosen");
}

-(void) buttonCancelChosen {
    NSLog(@"button Cancel is chosen");
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
