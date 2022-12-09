//
//  Delegate2.m
//  DelegateExample2
//
//  Created by Виталий Цыганенко on 10.12.2022.
//

#import "Delegate2.h"

@implementation Delegate2

- (NSInteger) tableView: (UITableView*)tableView numberOfRowsInSection: (NSInteger)section {
    return 4;
}

- (nonnull UITableViewCell*) tableView: (nonnull UITableView*)tableView cellForRowAtIndexPath: (nonnull NSIndexPath*) indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = @"Hello";
    return cell;
}

@end
