//
//  Delegate1.m
//  DelegateExample2
//
//  Created by Виталий Цыганенко on 09.12.2022.
//

#import "Delegate1.h"

@implementation Delegate1
{
    
}

- (NSInteger) tableView: (UITableView*)tableView numberOfRowsInSection: (NSInteger)section {
    return 2;
}

- (nonnull UITableViewCell*) tableView: (nonnull UITableView*)tableView cellForRowAtIndexPath: (nonnull NSIndexPath*) indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = @"Hello";
    return cell;
}

@end
