//
//  ArabicToRomanVC.m
//  IntRomanConverter
//
//  Created by Виталий Цыганенко on 24.04.2023.
//

#import "ArabicToRomanVC.h"

@interface ArabicToRomanVC ()
@property (nonatomic, weak) IBOutlet UILabel* romanLabel;
@property (nonatomic, weak) IBOutlet UILabel* arabicLabel;
@end

@implementation ArabicToRomanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction) numberButtonAction: (UIButton*) button {
    NSLog(@"numberButton %@", button.titleLabel.text);
}

-(IBAction) backspaceButtonAction {
    NSLog(@"backspaceButton");
}

-(IBAction) clearButtonAction {
    NSLog(@"clearButton");
}

@end
