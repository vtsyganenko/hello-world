//
//  main.m
//  WeatherRequestExample
//
//  Created by Виталий Цыганенко on 02.05.2023.
//

#import <Foundation/Foundation.h>

#import "CurrentWeatherRequest.h"
#import "CurrentWeatherData.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // initialize request class for using
        [CurrentWeatherRequest initializeParsing];
        
        // test parsing from file
        [CurrentWeatherRequest test];
        
        printf("\n\n");
        
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
        CurrentWeatherData* result = [CurrentWeatherRequest get:apiKey ForLatitude:NN_latitude ForLongitude:NN_longitude];
        NSLog(@"request result: %@", result);
        
    }
    return 0;
}
