//
//  ViewController2.m
//  TestProject
//
//  Created by Виталий Цыганенко on 08.04.2023.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction) onUnwindAction: (UIStoryboardSegue*) unwindSegue {
    NSLog(@"ViewController2 unwind action");
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
