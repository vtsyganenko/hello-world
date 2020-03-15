//
//  AppDelegate.m
//  Calculator
//
//  Created by Виталий Цыганенко on 15/03/2020.
//  Copyright © 2020 Виталий Цыганенко. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "CalcController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window  = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    
    ViewController* view = [[ViewController alloc] init];
    CalcController* calc = [[CalcController alloc] initWithViewController: view];
    NSLog(@"created! %p %p", view, calc);
    [view setCalcController: calc];
    NSLog(@"added!");
    self.window.rootViewController = view;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
