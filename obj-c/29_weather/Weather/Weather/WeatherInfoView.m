//
//  WeatherInfoView.m
//  Weather
//
//  Created by Виталий Цыганенко on 19.05.2023.
//

#import "WeatherInfoView.h"

@interface WeatherInfoView()
@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (strong, nonatomic) IBOutlet UILabel *label1;

@end

@implementation WeatherInfoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype) init {
    NSLog(@"WeatherInfoView::init");
    if(self = [super initWithFrame:CGRectMake(0, 0, 375, 1000)]) {
        [self setup];
    }
    return self;
}

-(instancetype) initWithFrame: (CGRect)frame {
    NSLog(@"WeatherInfoView::initWithFrame");
    if(self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(instancetype) initWithCoder: (NSCoder *)coder {
    NSLog(@"WeatherInfoView::initWithCoder");
    if(self = [super initWithCoder:coder]) {
        [self setup];
    }
    return self;
}

-(void) setup {
    NSLog(@"WeatherInfoView setup started");
    
    /*
     WAS:
    
    NSBundle* bundle = [NSBundle bundleForClass:[self class]];
    UINib* nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:bundle];
    self.contentView = [nib instantiateWithOwner:self options:nil][0];
    
    [self.contentView setFrame: self.bounds];
    [self.contentView setAutoresizingMask: UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];

    [self.contentView setBackgroundColor: [UIColor systemGreenColor]];
    
    
    [self addSubview: self.contentView];
    */
    
    NSBundle* bundle = [NSBundle mainBundle];
    [bundle loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    
    [self addSubview: self.contentView];
    
    NSLog(@"Content view frame %g %g", self.contentView.frame.size.width, self.contentView.frame.size.height);
    NSLog(@"Content view bounds %g %g", self.contentView.bounds.size.width, self.contentView.bounds.size.height);
    
    self.contentView.frame = self.bounds;
    
    NSLog(@"WeatherInfoView frame %g %g", self.frame.size.width, self.frame.size.height);
    NSLog(@"WeatherInfoView bounds %g %g", self.bounds.size.width, self.bounds.size.height);
    
    NSLog(@"WeatherInfoView setup finished");
}

@end
