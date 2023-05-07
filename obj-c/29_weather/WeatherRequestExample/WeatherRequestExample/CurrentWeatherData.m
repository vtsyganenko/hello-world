//
//  CurrentWeatherData.m
//  WeatherRequestExample
//
//  Created by Виталий Цыганенко on 05.05.2023.
//

#import <Foundation/Foundation.h>

#import "CurrentWeatherData.h"

@implementation CurrentWeatherData

@synthesize weatherId, weatherMain, weatherDescription, weatherIcon;

@synthesize temperatureC, temperatureMinC, temperatureMaxC, temperatureFeelsLikeC;
@synthesize humidityPersents, pressurehPa, pressureSeaLevelhPa, pressureGroundLevelhPa;

@synthesize visibilityMeter;

@synthesize windSpeedMS, windDirectionMeteoDegrees, windGustMS;

@synthesize cloudinessPersents;

@synthesize rainVolumeForLast1Hour, rainVolumeForLast3Hours;

@synthesize snowVolumeForLast1Hour, snowVolumeForLast3Hours;

@synthesize timestampUTC, timezoneShiftInSecFromUTC;

@synthesize cityName, cityID;

@synthesize country, timestampSunriseUTC, timestampSunsetUTC;

-(NSString*) description {
    return [NSString stringWithFormat:@"\n\
    Weather: id %d %@ (%@) icon %@ \n \
    Main: t %@ tMin %@ tMax %@ tFeel %@ humidity %d%% pressure %d hPa on sea level %d on ground level %d \n \
    Visibility: %d m \n \
    Wind: speed %d direction %@ gust %d \n \
    Cloudiness: %d%% \n \
    Rain voulme: one last hour %@ three last hours %@ \n \
    Snow volume: one last hour %@ three last hours %@ \n \
    Time: %lu timezone %li \n \
    City: \"%@\" id %lu \n \
    System: country \"%@\" sunrise %lu sunset %lu ",
    weatherId, weatherMain, weatherDescription, weatherIcon,
    temperatureC, temperatureMinC, temperatureMaxC, temperatureFeelsLikeC,
            humidityPersents, pressurehPa, pressureSeaLevelhPa, pressureGroundLevelhPa,
    visibilityMeter,
    windSpeedMS, windDirectionMeteoDegrees, windGustMS,
    cloudinessPersents,
    rainVolumeForLast1Hour, rainVolumeForLast3Hours,
    snowVolumeForLast1Hour, snowVolumeForLast3Hours,
    timestampUTC, timezoneShiftInSecFromUTC,
    cityName, cityID,
    country, timestampSunriseUTC, timestampSunsetUTC];
}

@end
