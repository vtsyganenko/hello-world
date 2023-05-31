//
//  ViewController.h
//  Weather
//
//  Created by Виталий Цыганенко on 14.05.2023.
//

#import <UIKit/UIKit.h>

@class LocationService;
@class RequestsController;

@interface ViewController : UIViewController

-(void) setLocationServiceObject: (LocationService*) service;
-(void) setRequestsControllerObject: (RequestsController*) controller;

@end

