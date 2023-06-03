//
//  LocationController.h
//  Weather
//
//  Created by Виталий Цыганенко on 18.05.2023.
//

#ifndef LocationController_h
#define LocationController_h

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CoordinatesUsageStatus) {
    CoordinatesUsageStatusUnknown,
    CoordinatesUsageStatusGPS,
    CoordinatesUsageStatusManual
};

@interface LocationController : NSObject

@property (nonatomic, readonly) CoordinatesUsageStatus coordinatesUsageStatus;
@property (nonatomic, readonly) BOOL gpsAvailable;

@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;

-(void) useCoordinatesFromGPS;
-(void) useManualCoordinates;
-(BOOL) isCorrectLatitude: (double) value;
-(BOOL) isCorrectLongitude: (double) value;
-(void) setManualLatitude: (double) latitudeValue andLongitude: (double) longitudeValue;
-(double) getGPSLatitude;
-(double) getGPSLongitude;

@end

#endif /* LocationController_h */
