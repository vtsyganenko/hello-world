//
//  RomanToArabicVC.m
//  IntRomanConverter
//
//  Created by Виталий Цыганенко on 24.04.2023.
//

#import "RomanToArabicVC.h"

@interface RomanToArabicVC ()
@property (nonatomic, weak) IBOutlet UILabel* arabicLabel;
@property (nonatomic, weak) IBOutlet UILabel* romanLabel;
@end

@implementation RomanToArabicVC

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
