//
//  LocationController.h
//  Weather
//
//  Created by Виталий Цыганенко on 18.05.2023.
//

#ifndef LocationController_h
#define LocationController_h

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, coordinatesUsageStatus) {
    CoordinateUsageStatusUnavailable,
    CoordinateUsageStatusAvailable,
    CoordinateUsageStatusManual
};

@interface LocationController : NSObject

-(void) useCoordinatesFromGPS;
-(void) useManualCoordinates;

@end

#endif /* LocationController_h */
