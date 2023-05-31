//
//  CoordinatesViewController.h
//  Weather
//
//  Created by Виталий Цыганенко on 15.05.2023.
//

#ifndef CoordinatesViewController_h
#define CoordinatesViewController_h

#import <UIKit/UIKit.h>

@class LocationService;

@interface CoordinatesViewController : UIViewController

-(void) setLocationService: (LocationService*) service;

@end

#endif /* CoordinatesViewController_h */
