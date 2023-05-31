//
//  CoordinatesViewController.m
//  Weather
//
//  Created by Виталий Цыганенко on 15.05.2023.
//

#import "CoordinatesViewController.h"

#import "LocationService.h"

#import "WeatherInfoView.h"

@interface CoordinatesViewController ()
@property (weak, nonatomic) LocationService* location;

@end

@implementation CoordinatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void) setLocationService: (LocationService*) service {
    self.location = service;
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
