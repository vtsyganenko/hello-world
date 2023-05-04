//
//  ViewController.m
//  NSBundleiOS
//
//  Created by Виталий Цыганенко on 03.05.2023.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *label2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// seems that in iOS project NSBundle works without any additional build phases

- (IBAction) actionTextToLabel {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"txt"];
    NSLog(@"%@", path);
    
    NSError* error;
    NSString* data = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if(error) {
        NSLog(@"%@", error);
    }
    else {
        [self.label1 setText:data];
    }
}

- (IBAction) actionClearLabel1 {
    [self.label1 setText:@"Label 1"];
}

- (IBAction) actionShowImage {
    NSString* path = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"jpeg"];
    NSLog(@"%@", path);
    
    UIImage* img = [UIImage imageWithContentsOfFile:path];
    [self.image setImage:img];
}

- (IBAction) actionClearImageView {
    [self.image setImage:nil];
}

- (IBAction) actionTextToLabel2 {
    NSArray* paths = [[NSBundle mainBundle] pathsForResourcesOfType:@"txt" inDirectory:@"codes"];
    if([paths count]) {
        NSLog(@"codes count %lu", [paths count]);
        [self.label2 setText:@""];
        
        // to except ... at the end of line if text doesn't fit
        [self.label2 setLineBreakMode: NSLineBreakByWordWrapping];
        
        [self.label2 setNumberOfLines: [paths count]];
        
        NSError* error;
        for(NSString* path in paths) {
            NSString* data = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
            if(error) {
                NSLog(@"%@", error);
            }
            else {
                NSString* newPart = [data stringByAppendingString:@"\n"];
                [self.label2 setText: [self.label2.text stringByAppendingString: newPart]];
            }
        }
    }
}

- (IBAction) actionClearLabel2 {
    [self.label2 setText:@"Label 2"];
}

@end
