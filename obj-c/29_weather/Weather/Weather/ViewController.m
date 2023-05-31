//
//  ViewController.m
//  Weather
//
//  Created by Виталий Цыганенко on 14.05.2023.
//

#import "ViewController.h"

#import "WeatherInfoView.h"
#import "WeatherInfoViewController.h"

#import "LocationService.h"
#import "LocationController.h"
#import "RequestsController.h"

#import "CoordinatesViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *coordinatesStatusLabel;
@property (strong, nonatomic) IBOutlet UIImageView *coordinatesStatusImage;
@property (strong, nonatomic) IBOutlet UIStackView* buttonsStackView;

@property (weak, nonatomic) LocationService* locationService;
@property (weak, nonatomic) RequestsController* requestsController;

@property (strong, nonatomic) WeatherInfoViewController* weatherInfoViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /*
    [self.scrollView setBackgroundColor: [UIColor whiteColor]];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    
    WeatherInfoView* customView = [[WeatherInfoView alloc] initWithFrame: CGRectZero];
    customView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.scrollView addSubview: customView];
     */
    
    /*
    [NSLayoutConstraint activateConstraints: @[
        [customView.leadingAnchor constraintEqualToAnchor: self.scrollView.contentLayoutGuide.leadingAnchor],
        [customView.trailingAnchor constraintEqualToAnchor: self.scrollView.contentLayoutGuide.trailingAnchor],
        [customView.topAnchor constraintEqualToAnchor: self.scrollView.contentLayoutGuide.topAnchor],
        [customView.bottomAnchor constraintEqualToAnchor: self.scrollView.contentLayoutGuide.bottomAnchor],
        [customView.widthAnchor constraintEqualToAnchor: self.scrollView.widthAnchor]
    ]];
     */
    
    //NSLog(@"scroll view frame %g %g", self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    //NSLog(@"scroll view bounds %g %g", self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    
    //NSLog(@"view.frame.size %f %f", customView.intrinsicContentSize.width, customView.intrinsicContentSize.height);
    //[self.scrollView setContentSize: CGSizeMake(375, 1015)];
    

    
    // before:
    /*
    WeatherInfoView* view = [[WeatherInfoView alloc] initWithFrame:CGRectZero];
    [self.scrollView addSubview: view];
    
    //NSLog(@"view.frame.size %f %f", customView.frame.size.width, customView.frame.size.height);
    [self.scrollView setContentSize: view.frame.size];
    
    //[self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize: CGSizeMake(375, 1015)];
    */
    
    // coordinates could be calculated from the below
    NSLog(@"latitude label: x %g y %g", self.latitudeLabel.frame.origin.x, self.latitudeLabel.frame.origin.y);
    NSLog(@"latitude label: width %g height %g", self.latitudeLabel.frame.size.width, self.latitudeLabel.frame.size.height);
    NSLog(@"Set Coordinates btn: x %g y %g", self.buttonsStackView.frame.origin.x, self.buttonsStackView.frame.origin.y);
    NSLog(@"Set Coordinates btn: width %g height %g", self.buttonsStackView.frame.size.width, self.buttonsStackView.frame.size.height);
    
    // coordinates, at first 580, should be calculated
    UIScrollView* sv = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 145, 375, 580)];
    [self.view addSubview: sv];
    [sv setBackgroundColor: UIColor.whiteColor];
    
    WeatherInfoView* weatherInfoView = [[WeatherInfoView alloc] init];
    //WeatherInfoView* view2 = [[WeatherInfoView alloc] initWithFrame:CGRectMake(0, 0, 375, 1000)];
    //WeatherInfoView* view2 = [[WeatherInfoView alloc] initWithFrame:CGRectMake(50, 250, 300, 300)];
    NSLog(@"TEST: view w: %g h: %g", weatherInfoView.bounds.size.width, weatherInfoView.bounds.size.height); // 0, 0 ???
    [sv addSubview: weatherInfoView];
    CGFloat y = 1000;
    
    
    CGSize sz = sv.bounds.size;
    sz.height = y;
    sv.contentSize = sz;
    
    self.weatherInfoViewController = [[WeatherInfoViewController alloc] initWithView: weatherInfoView];
}

-(void) setLocationServiceObject: (LocationService*) service {
    self.locationService = service;
}

-(void) setRequestsControllerObject: (RequestsController*) controller {
    self.requestsController = controller;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"SegueToCoordinatesScene"]) {
        NSLog(@"go to coordinates");
        CoordinatesViewController* c = (CoordinatesViewController*)segue.destinationViewController;
        [c setLocationService: self.locationService];
    }
    else if([segue.identifier isEqualToString:@"SegueToAboutScene"]) {
        NSLog(@"go to about");
    }
}

-(IBAction) unwindAction: (UIStoryboardSegue*) unwindSegue {
    
}

- (IBAction) requestButtonClick:(id)sender {
    
    NSLog(@"%g %g", self.locationService.latitude, self.locationService.longitude);
    
    CurrentWeatherInfo* info = [self.requestsController getCurrentWeatherRequest];

    [self.weatherInfoViewController showWeatherInfo: info];
}

-(void) showCoordinatesUsageStatus: (coordinatesUsageStatus) status {
    switch(status) {
        case CoordinateUsageStatusUnavailable:
            [self.coordinatesStatusLabel setText:@"Current coordinates (No data):"];
            [self.coordinatesStatusImage setImage:[UIImage systemImageNamed:@"xmark"]];
            break;
        case CoordinateUsageStatusAvailable:
            [self.coordinatesStatusLabel setText:@"Current coordinates (GPS):"];
            [self.coordinatesStatusImage setImage:[UIImage systemImageNamed:@"location"]];
            break;
        case CoordinateUsageStatusManual:
            [self.coordinatesStatusLabel setText:@"Current coordinates (Manual):"];
            [self.coordinatesStatusImage setImage:[UIImage systemImageNamed:@"gearshape"]];
            break;
        default:
            break;
    }
}

@end
