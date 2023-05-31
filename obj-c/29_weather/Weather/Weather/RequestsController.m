//
//  RequestsController.m
//  Weather
//
//  Created by Виталий Цыганенко on 31.05.2023.
//

#import <Foundation/Foundation.h>

#import "RequestsController.h"

#import "CurrentWeatherRequest.h"
#import "CurrentWeatherInfo.h"

@implementation RequestsController

-(CurrentWeatherInfo*) getCurrentWeatherRequest {
    
    NSLog(@"getCurrentWeatherRequest");
    
    // initialize request class for using
    [CurrentWeatherRequest initializeParsing];
    
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
    CurrentWeatherInfo* info = [[CurrentWeatherInfo alloc] initWithCurrentWeatherData:data];
    return info;
}

@end
