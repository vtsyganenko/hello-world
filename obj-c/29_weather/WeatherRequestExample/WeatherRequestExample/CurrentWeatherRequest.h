//
//  CurrentWeatherRequest.h
//  WeatherRequestExample
//
//  Created by Виталий Цыганенко on 05.05.2023.
//

#ifndef CurrentWeatherRequest_h
#define CurrentWeatherRequest_h

@class CurrentWeatherData;

@interface CurrentWeatherRequest : NSObject

// init before parsing
+(void) initializeParsing;

+(CurrentWeatherData*) get: (NSString*) apiKey ForLatitude: (double) latitude ForLongitude: (double) longitude;

// for testing
+(CurrentWeatherData*) testFromJson: (NSString*) jsonResponse;

@end

#endif /* CurrentWeatherRequest_h */
