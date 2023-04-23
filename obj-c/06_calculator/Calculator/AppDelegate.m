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
    
    // ViewController and CalcController should be interconnected
    ViewController* view = [[ViewController alloc] init];
    CalcController* controller = [[CalcController alloc] initWithViewController: view];
    [view setCalcController: controller];

    self.window.rootViewController = view;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
