//
//  CurrentWeatherInfo.m
//  WeatherRequestExample
//
//  Created by Виталий Цыганенко on 07.05.2023.
//

#import <Foundation/Foundation.h>

#import "CurrentWeatherInfo.h"

#import "CurrentWeatherData.h"

@implementation CurrentWeatherInfo

@synthesize weatherId, weatherMain, weatherDescription, weatherIcon;
@synthesize temperatureCelcius, temperatureMinCelcius, temperatureMaxCelcius, temperatureFeelsLikeCelcius;
@synthesize humidityPersents, pressureMmHg, pressureSeaLevelMmHg, pressureGroundLevelMmHg;
@synthesize visibilityMeter;
@synthesize windSpeedMS, windDirection, windGustMS;
@synthesize cloudinessPersents;
@synthesize rainVolumeForLast1Hour, rainVolumeForLast3Hours;
@synthesize snowVolumeForLast1Hour, snowVolumeForLast3Hours;
@synthesize timeLocal, timeOfSunriseLocal, timeOfSunsetLocal;
@synthesize timezoneShift;
@synthesize timeUTC, timeOfSunriseUTC, timeOfSunsetUTC;
@synthesize cityName, cityID, countryName;

#define HECTOPASCAL_TO_MM_HG 0.7501

#define WIND_DIRECTION_COUNT 17
double windDirectionDegreesLowerLimit[WIND_DIRECTION_COUNT] = {348.75, 0.0, 11.25, 33.75, 56.25, 78.75, 101.25, 123.75, 146.25, 168.75, 191.25, 213.75, 236.25, 258.75, 281.25, 303.75, 326.25};
double windDirectionDegreesUpperLimit[WIND_DIRECTION_COUNT] = {360.0, 11.25, 33.75, 56.25, 78.75, 101.25, 123.75, 146.25, 168.75, 191.25, 213.75, 236.25, 258.75, 281.25, 303.75, 326.25, 348.75};
NSArray<NSString*> *windDirectionNames = @[
    @"North wind (N)",
    @"North wind (N)",
    @"North-northeast wind (NNE)",
    @"Northeast wind (NE)",
    @"East-northeast wind (ENE)",
    @"East wind (E)",
    @"East-southeast wind (ESE)",
    @"Southeast wind (SE)",
    @"South-southeast wind (SSE)",
    @"South wind (S)",
    @"South-southwest wind (SSW)",
    @"Southwest wind (SW)",
    @"West-southwest wind (WSW)",
    @"West wind (W)",
    @"West-northwest wind (WNW)",
    @"Northwest wind (NW)",
    @"North-northwest wind (NNW)" ];


-(id) initWithCurrentWeatherData: (CurrentWeatherData*) data {
    if(self = [super init]) {
        
        // weather
        weatherId = data.weatherId;
        weatherMain = data.weatherMain;
        weatherDescription = data.weatherDescription;
        weatherIcon = data.weatherIcon;
        
        // main
        NSNumberFormatter* temperatureFrm = [[NSNumberFormatter alloc] init];
        [temperatureFrm setDecimalSeparator:@"."];
        [temperatureFrm setMinimumFractionDigits:0];
        
        temperatureCelcius = [temperatureFrm stringFromNumber:data.temperatureC];
        temperatureMinCelcius = [temperatureFrm stringFromNumber:data.temperatureMinC];
        temperatureMaxCelcius = [temperatureFrm stringFromNumber:data.temperatureMaxC];
        temperatureFeelsLikeCelcius = [temperatureFrm stringFromNumber:data.temperatureFeelsLikeC];
        
        if(data.humidityPersents && data.humidityPersents <= 100) {
            humidityPersents = [NSString stringWithFormat:@"%d%%", data.humidityPersents];
        }
        
        NSNumberFormatter* pressureFrm = [[NSNumberFormatter alloc] init];
        [pressureFrm setDecimalSeparator:@"."];
        [pressureFrm setMinimumFractionDigits:0];
        [pressureFrm setMaximumFractionDigits:1];
        
        double pressure = 0.0;
        if(data.pressurehPa) {
            pressure = data.pressurehPa * HECTOPASCAL_TO_MM_HG;
            pressureMmHg = [pressureFrm stringFromNumber:[NSNumber numberWithDouble:pressure]];
        }
        if(data.pressureSeaLevelhPa) {
            pressure = data.pressureSeaLevelhPa * HECTOPASCAL_TO_MM_HG;
            pressureSeaLevelMmHg = [pressureFrm stringFromNumber:[NSNumber numberWithDouble:pressure]];
        }
        if(data.pressureGroundLevelhPa) {
            pressure = data.pressureGroundLevelhPa * HECTOPASCAL_TO_MM_HG;
            pressureGroundLevelMmHg = [pressureFrm stringFromNumber:[NSNumber numberWithDouble:pressure]];
        }
        
        // visibility
        if(data.visibilityMeter) {
            NSNumberFormatter* visibilityFrm = [[NSNumberFormatter alloc] init];
            [visibilityFrm setMinimumFractionDigits:0];
            [visibilityFrm setMaximumFractionDigits:0];
            visibilityMeter = [visibilityFrm stringFromNumber: data.visibilityMeter];
        }

        // wind
        if(data.windSpeedMS)
            windSpeedMS = [NSString stringWithFormat:@"%u", data.windSpeedMS];
        
        if(data.windSpeedMS && data.windDirectionMeteoDegrees) {
            double value = [data.windDirectionMeteoDegrees doubleValue];
            // corner case: 0.0 - north
            if(value == 0.0) {
                windDirection = windDirectionNames[0];
            }
            else {
                for(unsigned int i=0; i<WIND_DIRECTION_COUNT; ++i) {
                    if(value > windDirectionDegreesLowerLimit[i] && value <= windDirectionDegreesUpperLimit[i]) {
                        windDirection = windDirectionNames[i];
                        break;
                    }
                }
            }
        }
        
        if(data.windGustMS)
            windGustMS = [NSString stringWithFormat:@"%u", data.windGustMS];
        
        // clouds
        if(data.cloudinessPersents)
            cloudinessPersents = [NSString stringWithFormat:@"%u%%", data.cloudinessPersents];
        
        // rain
        NSNumberFormatter* volumeFrm = [[NSNumberFormatter alloc] init];
        [volumeFrm setDecimalSeparator:@"."];
        [volumeFrm setMinimumFractionDigits:1];
        
        rainVolumeForLast1Hour = [volumeFrm stringFromNumber: data.rainVolumeForLast1Hour];
        rainVolumeForLast3Hours = [volumeFrm stringFromNumber: data.rainVolumeForLast3Hours];
        
        // snow
        snowVolumeForLast1Hour = [volumeFrm stringFromNumber: data.snowVolumeForLast1Hour];
        snowVolumeForLast3Hours = [volumeFrm stringFromNumber: data.snowVolumeForLast3Hours];
        
        // date & time UTC
        NSInteger timestamp = 0;
        if(data.timestampUTC) {
            timestamp = data.timestampUTC + data.timezoneShiftInSecFromUTC;
            timeLocal = [NSDate dateWithTimeIntervalSince1970: timestamp];
            timeUTC = [NSDate dateWithTimeIntervalSince1970: data.timestampUTC];
        }
        if(data.timestampSunriseUTC) {
            timestamp = data.timestampSunriseUTC + data.timezoneShiftInSecFromUTC;
            timeOfSunriseLocal = [NSDate dateWithTimeIntervalSince1970: timestamp];
            timeOfSunriseUTC = [NSDate dateWithTimeIntervalSince1970: data.timestampSunriseUTC];
        }
        if(data.timestampSunsetUTC) {
            timestamp = data.timestampSunsetUTC + data.timezoneShiftInSecFromUTC;
            timeOfSunsetLocal = [NSDate dateWithTimeIntervalSince1970: timestamp];
            timeOfSunsetUTC = [NSDate dateWithTimeIntervalSince1970: data.timestampSunsetUTC];
        }
        
        timezoneShift = data.timezoneShiftInSecFromUTC;
        
        // city and country
        cityName = data.cityName;
        cityID = data.cityID;
        countryName = data.country;
        
    }
    return self;
}

-(NSString*) description {
    return [NSString stringWithFormat:@"\n \
    WeatherInfo: \n \
    id: %u weather: %@ (%@) icon: %@ \n \
    Temperature: %@ min: %@ max: %@ feelsLike: %@ \n \
    Humidity: %@ pressure: %@ sea: %@ ground: %@ \n \
    Visibility: %@ \n \
    Wind: %@ direction: %@ gust: %@ \n \
    Clouds: %@ \n \
    Rain: one hour: %@ three hour: %@ \n \
    Snow: one hour: %@ three hour: %@ \n \
    UTC time: %@ sunrise: %@ sunset: %@ \n \
    timezone shift: %ld \n \
    Local time: %@ sunrise: %@ sunset: %@ \n \
    City: %@ id: %ld Country: %@",
    weatherId, weatherMain, weatherDescription, weatherIcon,
    temperatureCelcius, temperatureMinCelcius, temperatureMaxCelcius, temperatureFeelsLikeCelcius,
    humidityPersents, pressureMmHg, pressureSeaLevelMmHg, pressureGroundLevelMmHg,
    visibilityMeter,
    windSpeedMS, windDirection, windGustMS,
    cloudinessPersents,
    rainVolumeForLast1Hour, rainVolumeForLast3Hours,
    snowVolumeForLast1Hour, snowVolumeForLast3Hours,
    timeUTC, timeOfSunriseUTC, timeOfSunsetUTC,
    timezoneShift,
    timeLocal, timeOfSunriseLocal, timeOfSunsetLocal,
    cityName, cityID, countryName];
}

@end
