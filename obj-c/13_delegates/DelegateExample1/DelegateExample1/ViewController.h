//
//  ViewController.h
//  DelegateExample1
//
//  Created by Виталий Цыганенко on 09.12.2022.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

