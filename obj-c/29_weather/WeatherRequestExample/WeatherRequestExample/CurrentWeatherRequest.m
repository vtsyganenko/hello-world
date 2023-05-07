//
//  CurrentWeatherRequest.m
//  WeatherRequestExample
//
//  Created by Виталий Цыганенко on 05.05.2023.
//

#import <Foundation/Foundation.h>

#import "CurrentWeatherRequest.h"

#import "CurrentWeatherData.h"

static NSMutableDictionary* parserDict;

@implementation CurrentWeatherRequest

+(void) initializeParsing {
    parserDict = [[NSMutableDictionary alloc] init];
    [parserDict setValue:NSStringFromSelector(@selector(parseFieldMain:toObject:)) forKey:@"main"];
    [parserDict setValue:NSStringFromSelector(@selector(parseFieldWeather:toObject:)) forKey:@"weather"];
    [parserDict setValue:NSStringFromSelector(@selector(parseFieldWind:toObject:)) forKey:@"wind"];
    [parserDict setValue:NSStringFromSelector(@selector(parseFieldCloud:toObject:)) forKey:@"clouds"];
    [parserDict setValue:NSStringFromSelector(@selector(parseFieldRain:toObject:)) forKey:@"rain"];
    [parserDict setValue:NSStringFromSelector(@selector(parseFieldVisibility:toObject:)) forKey:@"visibility"];
    [parserDict setValue:NSStringFromSelector(@selector(parseFieldSnow:toObject:)) forKey:@"snow"];
    [parserDict setValue:NSStringFromSelector(@selector(parseFieldDt:toObject:)) forKey:@"dt"];
    [parserDict setValue:NSStringFromSelector(@selector(parseFieldTimezone:toObject:)) forKey:@"timezone"];
    [parserDict setValue:NSStringFromSelector(@selector(parseFieldName:toObject:)) forKey:@"name"];
    [parserDict setValue:NSStringFromSelector(@selector(parseFieldID:toObject:)) forKey:@"id"];
    [parserDict setValue:NSStringFromSelector(@selector(parseFieldSystem:toObject:)) forKey:@"sys"];
}

+(CurrentWeatherData*) get: (NSString*) apiKey ForLatitude: (double) latitude ForLongitude: (double) longitude {
    
    NSString* endpoint = @"api.openweathermap.org";
    NSString* latitudeStr = [NSString stringWithFormat:@"%g", latitude];
    NSString* longitudeStr = [NSString stringWithFormat:@"%g", longitude];
    
    NSString* url = [NSString stringWithFormat:
                     @"https://%@/data/2.5/weather?lat=%@&lon=%@&appid=%@&units=metric",
                     endpoint, latitudeStr, longitudeStr, apiKey];
    NSLog(@"CurrentWeatherRequest::get url: %@", url);
    
    NSURL *urlObj = [NSURL URLWithString:url];
    NSError* error;
    NSString* response = [NSString stringWithContentsOfURL:urlObj encoding:NSASCIIStringEncoding error:&error];
    if(error) {
        NSLog(@"CurrentWeatherRequest::get error %@", error);
        return nil;
    }
    
    NSLog(@"CurrentWeatherRequest::get response:\n %@", response);
    
    CurrentWeatherData* result = [[CurrentWeatherData alloc] init];
    BOOL status = [self parseJsonData:response toObject:result];
    NSLog(@"CurrentWeatherRequest::get json parsed with status %@", status ? @"Ok" : @"Failed");
    if(status == NO)
        result = nil;
    return result;
}

+(void) test {
    CurrentWeatherData* result = [[CurrentWeatherData alloc] init];
    
    NSError* error;
    NSString* testResponse = [NSString stringWithContentsOfFile:@"/Users/vitaly/Documents/github/hello-world/obj-c/29_weather/TestData.json" encoding:NSUTF8StringEncoding error:&error];
    if(error) {
        NSLog(@"CurrentWeatherRequest::test error %@", error);
        return;
    }
    
    BOOL status = [self parseJsonData: testResponse toObject: result];
    NSLog(@"CurrentWeatherRequest::test json parsed with status %@", status ? @"Ok" : @"Failed");
    NSLog(@"CurrentWeatherRequest::test %@", result);
}

+(BOOL) parseJsonData: (NSString*) response toObject: (CurrentWeatherData*) result {
    
    if([parserDict count] == 0) {
        NSLog(@"CurrentWeatherRequest::parseJsonData parser is not initialized - call initializeParsing:");
        return NO;
    }
    
    NSError* error;
    NSData* responseData = [response dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData: responseData options: NSJSONReadingMutableContainers error: &error];
    
    if (error) {
        NSLog(@"CurrentWeatherRequest::parseJsonData error: %@", error);
        return NO;
    }
    
    // enumerator is faster than array of keys
    NSEnumerator* enumerator = [data keyEnumerator];
    NSString* key;
    while(key = [enumerator nextObject]) {
        NSString* parsingMethodName = [parserDict valueForKey:key];
        if(parsingMethodName) {
            SEL method = NSSelectorFromString(parsingMethodName);
            if([self respondsToSelector:method]) {
                id dataForParsing = [data valueForKey:key];
                [self performSelector:method withObject:dataForParsing withObject:result];
            }
        }
    }
    return YES;
}

+(void) parseFieldMain: (id) data toObject: (CurrentWeatherData*) result {
    if([data isKindOfClass:[NSDictionary class]] == YES) {
        [result setTemperatureC: [data valueForKey:@"temp"]];
        [result setTemperatureMinC: [data valueForKey:@"temp_min"]];
        [result setTemperatureMaxC: [data valueForKey:@"temp_max"]];
        [result setTemperatureFeelsLikeC: [data valueForKey:@"feels_like"]];
        [result setPressurehPa: [[data valueForKey:@"pressure"] intValue]];
        [result setPressureSeaLevelhPa: [[data valueForKey:@"sea_level"] intValue]];
        [result setPressureGroundLevelhPa: [[data valueForKey:@"grnd_level"] intValue]];
        [result setHumidityPersents: [[data valueForKey:@"humidity"] intValue]];
    }
}

+(void) parseFieldWeather: (id) data toObject: (CurrentWeatherData*) result {
    if([data isKindOfClass:[NSArray class]] == YES) {
        if([data count] != 0) {
            id element = data[0];
            if([element isKindOfClass:[NSDictionary class]] == YES) {
                [result setWeatherId: [[element valueForKey:@"id"] intValue]];
                [result setWeatherMain: [element valueForKey:@"main"]];
                [result setWeatherDescription: [element valueForKey:@"description"]];
                [result setWeatherIcon: [element valueForKey:@"icon"]];
            }
        }
    }
}

+(void) parseFieldWind: (id) data toObject: (CurrentWeatherData*) result {
    if([data isKindOfClass:[NSDictionary class]] == YES) {
        [result setWindSpeedMS: [[data valueForKey:@"speed"] intValue]];
        [result setWindDirectionMeteoDegrees: [data valueForKey:@"deg"]];
        [result setWindGustMS: [[data valueForKey:@"gust"] intValue]];
    }
}

+(void) parseFieldCloud: (id) data toObject: (CurrentWeatherData*) result {
    if([data isKindOfClass:[NSDictionary class]] == YES) {
        [result setCloudinessPersents: [[data valueForKey:@"all"] intValue]];
    }
}

+(void) parseFieldRain: (id) data toObject: (CurrentWeatherData*) result {
    if([data isKindOfClass:[NSDictionary class]] == YES) {
        [result setRainVolumeForLast1Hour: [data valueForKey:@"1h"]];
        [result setRainVolumeForLast3Hours: [data valueForKey:@"3h"]];
    }
}

+(void) parseFieldVisibility: (id) data toObject: (CurrentWeatherData*) result {
    if([data isKindOfClass:[NSNumber class]] == YES) {
        [result setVisibilityMeter: [data intValue]];
    }
}

+(void) parseFieldSnow: (id) data toObject: (CurrentWeatherData*) result {
    if([data isKindOfClass:[NSDictionary class]] == YES) {
        [result setSnowVolumeForLast1Hour: [data valueForKey:@"1h"]];
        [result setSnowVolumeForLast3Hours: [data valueForKey:@"3h"]];
    }
}

+(void) parseFieldDt: (id) data toObject: (CurrentWeatherData*) result {
    if([data isKindOfClass:[NSNumber class]] == YES) {
        [result setTimestampUTC:[data integerValue]];
    }
}

+(void) parseFieldTimezone: (id) data toObject: (CurrentWeatherData*) result {
    if([data isKindOfClass:[NSNumber class]] == YES) {
        [result setTimezoneShiftInSecFromUTC:[data integerValue]];
    }
}

+(void) parseFieldName: (id) data toObject: (CurrentWeatherData*) result {
    if([data isKindOfClass:[NSString class]] == YES) {
        [result setCityName:data];
    }
}

+(void) parseFieldID: (id) data toObject: (CurrentWeatherData*) result {
    if([data isKindOfClass:[NSNumber class]] == YES) {
        [result setCityID:[data integerValue]];
    }
}

+(void) parseFieldSystem: (id) data toObject: (CurrentWeatherData*) result {
    if([data isKindOfClass:[NSDictionary class]] == YES) {
        [result setCountry: [data valueForKey:@"country"]];
        [result setTimestampSunriseUTC: [[data valueForKey:@"sunrise"] integerValue]];
        [result setTimestampSunsetUTC: [[data valueForKey:@"sunset"] integerValue]];
    }
}

@end
