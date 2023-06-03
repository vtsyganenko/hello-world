//
//  LocationService.m
//  Weather
//
//  Created by Виталий Цыганенко on 15.05.2023.
//

#import "LocationService.h"

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationService ()
@property (strong, nonatomic) CLLocationManager* locationManager;

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) BOOL locationEnabled;
@end

@implementation LocationService

-(id) init {
    if(self = [super init]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        
        [self.locationManager requestWhenInUseAuthorization];
        
        [self.locationManager startUpdatingLocation];
    }
    return self;
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation* location = [self.locationManager location];
    self.latitude = location.coordinate.latitude;
    self.longitude = location.coordinate.longitude;
    NSLog(@"LocationService got %g %g", self.latitude, self.longitude);
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"LocationService error: %@", error);
}

-(void) locationManagerDidChangeAuthorization:(CLLocationManager *)manager {
    if(manager.authorizationStatus == kCLAuthorizationStatusAuthorizedAlways ||
       manager.authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse) {
        self.locationEnabled = YES;
        NSLog(@"LocationService locationEnabled");
    }
    else {
        self.locationEnabled = NO;
        NSLog(@"LocationService locationDisabled");
    }
}

@end
