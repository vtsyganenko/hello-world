//
//  CurrentWeatherData.h
//  WeatherRequestExample
//
//  Created by Виталий Цыганенко on 05.05.2023.
//

#ifndef CurrentWeatherData_h
#define CurrentWeatherData_h

@interface CurrentWeatherData : NSObject

// weather
@property (nonatomic) unsigned weatherId;
@property (nonatomic, null_unspecified) NSString* weatherMain;
@property (nonatomic, null_unspecified) NSString* weatherDescription;
@property (nonatomic, null_unspecified) NSString* weatherIcon;

// main
@property (nonatomic, nullable) NSNumber* temperatureC;             // double
@property (nonatomic, nullable) NSNumber* temperatureMinC;          // double
@property (nonatomic, nullable) NSNumber* temperatureMaxC;          // double
@property (nonatomic, nullable) NSNumber* temperatureFeelsLikeC;    // double
@property (nonatomic) unsigned humidityPersents;
@property (nonatomic) unsigned pressurehPa;
@property (nonatomic) unsigned pressureSeaLevelhPa;
@property (nonatomic) unsigned pressureGroundLevelhPa;

// visibility
@property (nonatomic) unsigned visibilityMeter;

// wind
@property (nonatomic) unsigned windSpeedMS;
@property (nonatomic, nullable) NSNumber* windDirectionMeteoDegrees;    // unsigned
@property (nonatomic) unsigned windGustMS;

// clouds
@property (nonatomic) unsigned cloudinessPersents;

// rain
@property (nonatomic, nullable) NSNumber* rainVolumeForLast1Hour;   // double
@property (nonatomic, nullable) NSNumber* rainVolumeForLast3Hours;  // double

// snow
@property (nonatomic, nullable) NSNumber* snowVolumeForLast1Hour;   // double
@property (nonatomic, nullable) NSNumber* snowVolumeForLast3Hours;  // double

// date & time
@property (nonatomic) NSUInteger timestampUTC;              // "dt"
@property (nonatomic) NSInteger timezoneShiftInSecFromUTC;  // "timezone"

// city: name & id
@property (nonatomic, null_unspecified) NSString* cityName;
@property (nonatomic) NSUInteger cityID;

// system
@property (nonatomic, null_unspecified) NSString* country;
@property (nonatomic) NSUInteger timestampSunriseUTC;
@property (nonatomic) NSUInteger timestampSunsetUTC;

@end

#endif /* CurrentWeatherData_h */
