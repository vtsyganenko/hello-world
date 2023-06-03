//
//  ViewController.h
//  Weather
//
//  Created by Виталий Цыганенко on 14.05.2023.
//

#import <UIKit/UIKit.h>

@class LocationController;
@class RequestsController;

@interface ViewController : UIViewController

-(void) setLocationControllerObject: (LocationController*) controller;
-(void) setRequestsControllerObject: (RequestsController*) controller;

@end

