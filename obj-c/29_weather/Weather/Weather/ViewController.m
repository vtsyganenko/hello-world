//
//  ViewController.m
//  Weather
//
//  Created by Виталий Цыганенко on 14.05.2023.
//

#import "ViewController.h"

#import "WeatherInfoView.h"
#import "WeatherInfoViewController.h"

#import "LocationController.h"
#import "RequestsController.h"

#import "CoordinatesViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *coordinatesStatusLabel;
@property (strong, nonatomic) IBOutlet UIImageView *coordinatesStatusImage;
@property (strong, nonatomic) IBOutlet UIStackView* buttonsStackView;

@property (weak, nonatomic) LocationController* locationController;
@property (weak, nonatomic) RequestsController* requestsController;

@property (strong, nonatomic) WeatherInfoViewController* weatherInfoViewController;

@end

static NSString* const locationLatitudeContext = @"LocationLatitudeChanged";
static NSString* const locationLongitudeContext = @"LocationLongitudeChanged";
static NSString* const locationStatusContext = @"LocationStatusChanged";
static NSString* const locationGPSAvailabilityContext = @"LocationGPSAvailabilityChanged";

@implementation ViewController {
    NSMutableArray* locationObservedKeys;
}

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
    
    locationObservedKeys = [[NSMutableArray alloc] init];
    [self.locationController addObserver:self forKeyPath:@"latitude" options:0 context:(void*)locationLatitudeContext];
    [locationObservedKeys addObject:@"latitude"];
    [self.locationController addObserver:self forKeyPath:@"longitude" options:0 context:(void*)locationLongitudeContext];
    [locationObservedKeys addObject:@"longitude"];
    [self.locationController addObserver:self forKeyPath:@"coordinatesUsageStatus" options:0 context:(void*)locationStatusContext];
    [locationObservedKeys addObject:@"coordinatesUsageStatus"];
    [self.locationController addObserver:self forKeyPath:@"gpsAvailable" options:0 context:(void*)locationGPSAvailabilityContext];
    [locationObservedKeys addObject:@"gpsAvailable"];
    
}

-(void) dealloc {
    for(NSString* key in locationObservedKeys) {
        [self.locationController removeObserver:self forKeyPath:key];
    }
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    
    if(context == CFBridgingRetain(locationLatitudeContext)) {
        [self.latitudeLabel setText: [NSString stringWithFormat:@"%g", self.locationController.latitude]];
        return;
    }
    if(context == CFBridgingRetain(locationLongitudeContext)) {
        [self.longitudeLabel setText: [NSString stringWithFormat:@"%g", self.locationController.longitude]];
        return;
    }
    if(context == CFBridgingRetain(locationStatusContext)) {
        [self showCoordinatesUsageStatus: self.locationController.coordinatesUsageStatus];
        return;
    }
    if(context == CFBridgingRetain(locationGPSAvailabilityContext)) {
        if(self.locationController.coordinatesUsageStatus == CoordinatesUsageStatusManual &&
           self.locationController.gpsAvailable == YES) {
            
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"GPS" message:@"Location from GPS is available" preferredStyle:UIAlertControllerStyleAlert];
            
            void (^okHandler) (UIAlertAction* action) =
                ^(UIAlertAction* action) {
                    if(self.locationController.gpsAvailable) {
                        [self.locationController useCoordinatesFromGPS];
                    }
            };
            
            UIAlertAction* buttonOk = [UIAlertAction actionWithTitle:@"Use GPS" style:UIAlertActionStyleDefault handler:okHandler];
            UIAlertAction* buttonCancel = [UIAlertAction actionWithTitle:@"Remain manual" style:UIAlertActionStyleDefault handler:0];
            
            [alert addAction:buttonOk];
            [alert addAction:buttonCancel];
            
            [self presentViewController:alert animated:YES completion:0];
        }
        return;
    }
}

-(void) setLocationControllerObject: (LocationController*) controller {
    self.locationController = controller;
}

-(void) setRequestsControllerObject: (RequestsController*) controller {
    self.requestsController = controller;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"SegueToCoordinatesScene"]) {
        CoordinatesViewController* coordinatesView = (CoordinatesViewController*)segue.destinationViewController;
        [coordinatesView setLocationController: self.locationController];
    }
}

-(IBAction) unwindAction: (UIStoryboardSegue*) unwindSegue {
    
}

- (IBAction) requestButtonClick:(id)sender {
    
    NSLog(@"Coordinates for request: %g %g", self.locationController.latitude, self.locationController.longitude);
    

    //CurrentWeatherInfo* info = [self.requestsController getCurrentWeatherRequest];
    //[self.weatherInfoViewController showWeatherInfo: info];
}

-(void) showCoordinatesUsageStatus: (CoordinatesUsageStatus) status {
    switch(status) {
        case CoordinatesUsageStatusUnknown:
            [self.coordinatesStatusLabel setText:@"Current coordinates (No data):"];
            [self.coordinatesStatusImage setImage:[UIImage systemImageNamed:@"xmark"]];
            break;
        case CoordinatesUsageStatusGPS:
            [self.coordinatesStatusLabel setText:@"Current coordinates (GPS):"];
            [self.coordinatesStatusImage setImage:[UIImage systemImageNamed:@"location"]];
            break;
        case CoordinatesUsageStatusManual:
            [self.coordinatesStatusLabel setText:@"Current coordinates (Manual):"];
            [self.coordinatesStatusImage setImage:[UIImage systemImageNamed:@"gearshape"]];
            break;
        default:
            break;
    }
}

@end
