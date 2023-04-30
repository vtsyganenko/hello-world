//
//  RomanToArabicVC.m
//  IntRomanConverter
//
//  Created by Виталий Цыганенко on 24.04.2023.
//

#import "RomanToArabicVC.h"

#import "converter_wrapper.h"
#import "RomanValueVerifier.h"

@interface RomanToArabicVC ()
@property (nonatomic, weak) IBOutlet UILabel* arabicLabel;
@property (nonatomic, weak) IBOutlet UILabel* romanLabel;

@property (nonatomic, strong) RomanValueVerifier* romanVerifier;
@end

@implementation RomanToArabicVC

@synthesize converter;
@synthesize romanVerifier;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.romanVerifier = [[RomanValueVerifier alloc] init];
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
