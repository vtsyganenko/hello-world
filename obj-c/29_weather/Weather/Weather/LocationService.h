//
//  LocationService.h
//  Weather
//
//  Created by Виталий Цыганенко on 15.05.2023.
//

#ifndef LocationService_h
#define LocationService_h

#import <CoreLocation/CLLocationManagerDelegate.h>

@interface LocationService : NSObject <CLLocationManagerDelegate>

@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;

@property (nonatomic, readonly) BOOL locationEnabled;

@end

#endif /* LocationService_h */
