//
//  ViewController.m
//  ManualRetainRelease4
//
//  Created by Виталий Цыганенко on 05.03.2023.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize data1;
@synthesize data2;
@synthesize data3;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"ViewController viewDidLoad");
    
    // Here is three methods to prevent these values be destroyed on pool draining
    
    // being added to autorelease pool, but make +1 retain
    data1 = [[MyMutableArray array] retain];
    [data1 setValue:1];
    
    // avoid falling into autorelease pool
    data2 = [[MyMutableArray alloc] init];
    [data2 setValue:2];
    
    // being added to autorelease pool, use setter with "retain" attribute
    self.data3 = [MyMutableArray array];
    [data3 setValue:3];
    
    NSLog(@"data1 retainCount: %lu", [data1 retainCount]); // 2
    NSLog(@"data2 retainCount: %lu", [data2 retainCount]); // 1
    NSLog(@"data3 retainCount: %lu", [data3 retainCount]); // 2
    
    // after this handler finish (finish handling event) autorelease pool is drained
    // objects in pool (1 and 3) get [retain:] message
}

- (void) dealloc {
    NSLog(@"ViewController dealloc");
    
    NSLog(@"data1 retainCount: %lu", [data1 retainCount]);
    NSLog(@"data2 retainCount: %lu", [data2 retainCount]);
    NSLog(@"data3 retainCount: %lu", [data3 retainCount]);
    
    [data1 release];
    [data2 release];
    [data3 release];
    
    [super dealloc];
}

@end
