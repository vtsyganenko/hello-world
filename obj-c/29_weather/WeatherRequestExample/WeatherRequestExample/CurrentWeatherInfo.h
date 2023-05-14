//
//  CurrentWeatherInfo.h
//  WeatherRequestExample
//
//  Created by Виталий Цыганенко on 07.05.2023.
//

#ifndef CurrentWeatherInfo_h
#define CurrentWeatherInfo_h

@class CurrentWeatherData;

@interface CurrentWeatherInfo : NSObject

-(id) initWithCurrentWeatherData: (CurrentWeatherData*) data;

@property (nonatomic, readonly) unsigned weatherId;
@property (nonatomic, readonly) NSString* weatherMain;
@property (nonatomic, readonly) NSString* weatherDescription;
@property (nonatomic, readonly) NSString* weatherIcon;

@property (nonatomic, readonly) NSString* temperatureCelcius;
@property (nonatomic, readonly) NSString* temperatureMinCelcius;
@property (nonatomic, readonly) NSString* temperatureMaxCelcius;
@property (nonatomic, readonly) NSString* temperatureFeelsLikeCelcius;
@property (nonatomic, readonly) NSString* humidityPersents;
@property (nonatomic, readonly) NSString* pressureMmHg;
@property (nonatomic, readonly) NSString* pressureSeaLevelMmHg;
@property (nonatomic, readonly) NSString* pressureGroundLevelMmHg;

@property (nonatomic, readonly) NSString* visibilityMeter;

@property (nonatomic, readonly) NSString* windSpeedMS;
@property (nonatomic, readonly) NSString* windDirection;
@property (nonatomic, readonly) NSString* windGustMS;

@property (nonatomic, readonly) NSString* cloudinessPersents;

@property (nonatomic, readonly) NSString* rainVolumeForLast1Hour;
@property (nonatomic, readonly) NSString* rainVolumeForLast3Hours;

@property (nonatomic, readonly) NSString* snowVolumeForLast1Hour;
@property (nonatomic, readonly) NSString* snowVolumeForLast3Hours;

@property (nonatomic, readonly) NSDate* timeLocal;
@property (nonatomic, readonly) NSDate* timeOfSunriseLocal;
@property (nonatomic, readonly) NSDate* timeOfSunsetLocal;
@property (nonatomic, readonly) NSInteger timezoneShift;
@property (nonatomic, readonly) NSDate* timeUTC;
@property (nonatomic, readonly) NSDate* timeOfSunriseUTC;
@property (nonatomic, readonly) NSDate* timeOfSunsetUTC;

@property (nonatomic, readonly) NSString* cityName;
@property (nonatomic, readonly) NSInteger cityID;
@property (nonatomic, readonly) NSString* countryName;

@end

#endif /* CurrentWeatherInfo_h */
