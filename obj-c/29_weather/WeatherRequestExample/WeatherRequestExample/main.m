//
//  main.m
//  WeatherRequestExample
//
//  Created by Виталий Цыганенко on 02.05.2023.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // get API key from bundle
        NSString* apiKey = @"";
        {
            NSString* filePath = [[NSBundle mainBundle] pathForResource:@"key" ofType:@"txt"];
            if(filePath) {
                NSError* error;
                NSString* data = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
                if(error) {
                    NSLog(@"%@", error);
                }
                else {
                    apiKey = data;
                }
            }
        }
        
        if([apiKey isEqualToString:@""]) {
            NSLog(@"no api key!");
            return 0;
        }
        
        NSString* endpoint = @"api.openweathermap.org";
        
        NSString* latitude = @"56.3230";
        NSString* longitude = @"43.9427";
        
        NSString* url = [NSString stringWithFormat:
                         @"https://%@/data/2.5/weather?lat=%@&lon=%@&appid=%@", endpoint, latitude, longitude, apiKey];
        
        NSLog(@"call url:\n%@", url);
        NSLog(@" ");
        
        
        NSURL *urlObj = [NSURL URLWithString:url];
        
        NSError* error;
        NSString* response = [NSString stringWithContentsOfURL:urlObj encoding:NSASCIIStringEncoding error:&error];
        
        if(error) {
            NSLog(@"%@", error);
        }
        else {
            NSLog(@"%@", response);
        }
        NSLog(@" ");
        
        NSData* data = [response dataUsingEncoding:NSUTF8StringEncoding];
        NSArray *dataArray = [NSJSONSerialization JSONObjectWithData: data options:  NSJSONReadingMutableContainers error: &error];

        if (!dataArray) {
            NSLog(@"Error parsing JSON: %@", error);
        } else {
            //for(NSDictionary *item in dataArray) {
            //    NSLog(@"Item: %@", item);
            //}
        }
        
    }
    return 0;
}
