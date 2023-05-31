//
//  WeatherInfoView.h
//  Weather
//
//  Created by Виталий Цыганенко on 19.05.2023.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface WeatherInfoView : UIView

@property (nonatomic, strong) IBOutlet UILabel* cityLabel;
@property (nonatomic, strong) IBOutlet UILabel* mainWeatherLabel;
@property (nonatomic, strong) IBOutlet UILabel* descriptionOfWeatherLabel;

@end

NS_ASSUME_NONNULL_END
