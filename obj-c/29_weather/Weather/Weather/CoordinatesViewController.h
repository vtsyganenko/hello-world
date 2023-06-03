//
//  CoordinatesViewController.h
//  Weather
//
//  Created by Виталий Цыганенко on 15.05.2023.
//

#ifndef CoordinatesViewController_h
#define CoordinatesViewController_h

#import <UIKit/UIKit.h>

@class LocationController;

@interface CoordinatesViewController : UIViewController

-(void) setLocationController: (LocationController*) controller;

@end

#endif /* CoordinatesViewController_h */
