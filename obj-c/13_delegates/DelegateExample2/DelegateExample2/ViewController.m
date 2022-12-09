//
//  ViewController.m
//  DelegateExample2
//
//  Created by Виталий Цыганенко on 09.12.2022.
//

#import "ViewController.h"

#import "Delegates/Delegate1.h"
#import "Delegates/Delegate2.h"
#import "Delegates/Delegate3.h"

@interface ViewController ()
{
    Delegate1* delegate1;
    Delegate2* delegate2;
    Delegate3* delegate3;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    delegate1 = [[Delegate1 alloc] init];
    delegate2 = [[Delegate2 alloc] init];
    delegate3 = [[Delegate3 alloc] init];
    
}

- (IBAction) button1Click:(id)sender {
    NSLog(@"button1Click");
    [_tableView setDelegate:delegate1];
    [_tableView setDataSource:delegate1];
    [_tableView reloadData];
}

- (IBAction) button2Click:(id)sender {
    NSLog(@"button2Click");
    [_tableView setDelegate:delegate2];
    [_tableView setDataSource:delegate2];
    [_tableView reloadData];
}

- (IBAction) button3Click:(id)sender {
    NSLog(@"button3Click");
    [_tableView setDelegate:delegate3];
    [_tableView setDataSource:delegate3];
    [_tableView reloadData];
}

@end
