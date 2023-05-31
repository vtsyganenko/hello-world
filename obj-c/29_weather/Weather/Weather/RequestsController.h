//
//  RequestsController.h
//  Weather
//
//  Created by Виталий Цыганенко on 31.05.2023.
//

#ifndef RequestsController_h
#define RequestsController_h

@class CurrentWeatherInfo;

@interface RequestsController : NSObject

-(CurrentWeatherInfo*) getCurrentWeatherRequest;

@end

#endif /* RequestsController_h */
