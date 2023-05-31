//
//  WeatherInfoViewController.m
//  Weather
//
//  Created by Виталий Цыганенко on 19.05.2023.
//

#import "WeatherInfoViewController.h"

#import "WeatherInfoView.h"
#import "CurrentWeatherInfo.h"

@interface WeatherInfoViewController ()
@property (nonatomic, strong) WeatherInfoView* weatherInfoView;
@end

@implementation WeatherInfoViewController

@synthesize weatherInfoView;

-(id) initWithView: (WeatherInfoView*) view {
    if(self = [super init]) {
        self.weatherInfoView = view;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void) showWeatherInfo: (CurrentWeatherInfo*) info {
    [weatherInfoView.cityLabel setText: info.cityName];
    [weatherInfoView.mainWeatherLabel setText: info.weatherMain];
    [weatherInfoView.descriptionOfWeatherLabel setText: info.weatherDescription];
    
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
