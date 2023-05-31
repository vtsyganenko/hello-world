//
//  AboutViewController.m
//  Weather
//
//  Created by Виталий Цыганенко on 15.05.2023.
//

#import "AboutViewController.h"

#import "WeatherInfoView.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

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

-(IBAction) tapHandler: (UITapGestureRecognizer*) recognizer {
    NSURL* url = [NSURL URLWithString:@"https://openweathermap.org"];
    [[UIApplication sharedApplication] openURL:url options:[NSDictionary dictionary] completionHandler:nil];
}

@end
