//
//  main.m
//  WeatherRequestExample
//
//  Created by Виталий Цыганенко on 02.05.2023.
//

#import <Foundation/Foundation.h>

#import "CurrentWeatherRequest.h"
#import "CurrentWeatherData.h"
#import "CurrentWeatherInfo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // initialize request class for using
        [CurrentWeatherRequest initializeParsing];
        
        NSLog(@"Test CurrentWeatherRequest with data from file:");
        
        // get json data from bundle
        NSString* testResponse;
        {
            NSString* filePath = [[NSBundle mainBundle] pathForResource:@"TestData" ofType:@"json"];
            if(filePath) {
                NSError* error;
                testResponse = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
                if(error) {
                    NSLog(@"%@", error);
                }
            }
        }
        
        CurrentWeatherData* data = [CurrentWeatherRequest testFromJson:testResponse];
        NSLog(@"%@", data);
        
        CurrentWeatherInfo* info = [[CurrentWeatherInfo alloc] initWithCurrentWeatherData:data];
        NSLog(@"%@", info);
        
        printf("\n\n");
        NSLog(@"Test CurrentWeatherRequest with real request:");
        
        // get API key from bundle
        NSString* apiKey = @"";
        {
            NSString* filePath = [[NSBundle mainBundle] pathForResource:@"key" ofType:@"txt"];
            if(filePath) {
                NSError* error;
                apiKey = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
                if(error) {
                    NSLog(@"%@", error);
                }
            }
            if([apiKey isEqualToString:@""]) {
                NSLog(@"no api key!");
                return 0;
            }
        }
        
        // make request
        double NN_latitude = 56.3230;
        double NN_longitude = 43.9427;
        data = [CurrentWeatherRequest get:apiKey ForLatitude:NN_latitude ForLongitude:NN_longitude];
        NSLog(@"%@", data);
        
        info = [[CurrentWeatherInfo alloc] initWithCurrentWeatherData:data];
        NSLog(@"%@", info);
        
    }
    return 0;
}
