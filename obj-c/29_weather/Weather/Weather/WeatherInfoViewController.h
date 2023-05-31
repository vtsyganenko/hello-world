//
//  WeatherInfoViewController.h
//  Weather
//
//  Created by Виталий Цыганенко on 19.05.2023.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class WeatherInfoView;
@class CurrentWeatherInfo;

@interface WeatherInfoViewController : UIViewController

-(id) initWithView: (WeatherInfoView*) view;

-(void) showWeatherInfo: (CurrentWeatherInfo*) info;

@end

NS_ASSUME_NONNULL_END
