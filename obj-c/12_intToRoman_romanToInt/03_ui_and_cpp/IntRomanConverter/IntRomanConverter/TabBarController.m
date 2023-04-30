//
//  TabBarController.m
//  IntRomanConverter
//
//  Created by Виталий Цыганенко on 24.04.2023.
//

#import "TabBarController.h"

#import "converter_wrapper.h"
#import "ConverterProtocol.h"

@interface TabBarController ()
@property (nonatomic, strong) ConverterWrapper* converter;
@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.converter = [[ConverterWrapper alloc] init];
    
    for(UIViewController<ConverterProtocol>* tab in self.viewControllers) {
        [tab setConverter:self.converter];
    }
    
    
    // ?
    self.tabBar.unselectedItemTintColor = UIColor.whiteColor;
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
