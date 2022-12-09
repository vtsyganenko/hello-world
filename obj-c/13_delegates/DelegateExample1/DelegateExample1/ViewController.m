//
//  ViewController.m
//  DelegateExample1
//
//  Created by Виталий Цыганенко on 09.12.2022.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray* fruits;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    fruits = @[@"Apple", @"Mango", @"Orange"];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return fruits.count;
}

- (nonnull UITableViewCell*) tableView: (nonnull UITableView*)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = fruits[indexPath.row];
    return cell;
}

@end
