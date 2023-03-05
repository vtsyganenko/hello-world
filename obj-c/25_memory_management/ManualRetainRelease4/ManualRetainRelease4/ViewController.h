//
//  ViewController.h
//  ManualRetainRelease4
//
//  Created by Виталий Цыганенко on 05.03.2023.
//

#import <UIKit/UIKit.h>

#import "MyMutableArray.h"

@interface ViewController : UIViewController

@property (nonatomic, retain) MyMutableArray* data1;
@property (nonatomic, retain) MyMutableArray* data2;
@property (nonatomic, retain) MyMutableArray* data3;

@end

