//
//  LocationController.m
//  Weather
//
//  Created by Виталий Цыганенко on 18.05.2023.
//

#import "LocationController.h"

#import "LocationService.h"

@interface LocationController()
@property (nonatomic) CoordinatesUsageStatus coordinatesUsageStatus;
@property (nonatomic) BOOL gpsAvailable;

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;

@property (nonatomic, strong) LocationService* locationService;
@end

const double MIN_LATITUDE = -90.0;
const double MAX_LATITUDE = 90.0;
const double MIN_LONGITUDE = -180.0;
const double MAX_LONGITUDE = 180.0;

static NSString* const locationLatitudeContext = @"gpsLatitudeChanged";
static NSString* const locationLongitudeContext = @"gpsLongitudeChanged";
static NSString* const locationEnabledContext = @"gpsLocationEnabled";

@implementation LocationController {
    NSMutableArray* locationObservedKeys;
}

-(id) init {
    if(self = [super init]) {
        self.coordinatesUsageStatus = CoordinatesUsageStatusUnknown;
        
        self.locationService = [[LocationService alloc] init];
        
        locationObservedKeys = [[NSMutableArray alloc] init];
        [self.locationService addObserver:self forKeyPath:@"latitude" options:0 context: (void*)locationLatitudeContext];
        [locationObservedKeys addObject:@"latitude"];
        [self.locationService addObserver:self forKeyPath:@"longitude" options:0 context: (void*)locationLongitudeContext];
        [locationObservedKeys addObject:@"longitude"];
        [self.locationService addObserver:self forKeyPath:@"locationEnabled" options:0 context:(void*)locationEnabledContext];
        [locationObservedKeys addObject:@"locationEnabled"];
    }
    return self;
}

-(void) dealloc {
    for(NSString* key in locationObservedKeys) {
        [self.locationService removeObserver:self forKeyPath:key];
    }
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    
    if(context == CFBridgingRetain(locationLatitudeContext)) {
        if(self.coordinatesUsageStatus == CoordinatesUsageStatusGPS)
            self.latitude = self.locationService.latitude;
        return;
    }
    if(context == CFBridgingRetain(locationLongitudeContext)) {
        if(self.coordinatesUsageStatus == CoordinatesUsageStatusGPS)
            self.longitude = self.locationService.longitude;
        return;
    }
    if(context == CFBridgingRetain(locationEnabledContext)) {
        self.gpsAvailable = self.locationService.locationEnabled;
        NSLog(@"gpsAvailable %@", self.gpsAvailable ? @"YES" : @"NO");
        
        // on startup
        if(self.coordinatesUsageStatus == CoordinatesUsageStatusUnknown) {
            if(self.gpsAvailable)
                self.coordinatesUsageStatus = CoordinatesUsageStatusGPS;
            else
                self.coordinatesUsageStatus = CoordinatesUsageStatusManual;
            return;
        }

        // GPS became unavailable
        if(self.coordinatesUsageStatus == CoordinatesUsageStatusGPS && self.gpsAvailable == NO)
            self.coordinatesUsageStatus = CoordinatesUsageStatusManual;
        return;
    }
}

-(void) useCoordinatesFromGPS {
    if(self.gpsAvailable) {
        self.coordinatesUsageStatus = CoordinatesUsageStatusGPS;
        self.latitude = self.locationService.latitude;
        self.longitude = self.locationService.longitude;
    }
}

-(void) useManualCoordinates {
    self.coordinatesUsageStatus = CoordinatesUsageStatusManual;
    self.latitude = 0.0;
    self.longitude = 0.0;
}

-(BOOL) isCorrectLatitude: (double) value {
    return value >= MIN_LATITUDE && value <= MAX_LATITUDE;
}

-(BOOL) isCorrectLongitude: (double) value {
    return value >= MIN_LONGITUDE && value <= MAX_LONGITUDE;
}

-(void) setManualLatitude: (double) latitudeValue andLongitude: (double) longitudeValue {
    if(self.coordinatesUsageStatus == CoordinatesUsageStatusManual) {
        self.latitude = latitudeValue;
        self.longitude = longitudeValue;
    }
}

-(double) getGPSLatitude {
    return self.locationService.latitude;
}

-(double) getGPSLongitude {
    return self.locationService.longitude;
}

@end
