//
//  CoordinatesViewController.m
//  Weather
//
//  Created by Виталий Цыганенко on 15.05.2023.
//

#import "CoordinatesViewController.h"

#import "LocationController.h"

#import "WeatherInfoView.h"

@interface CoordinatesViewController ()
@property (weak, nonatomic) LocationController* locationCtrl;

@property (strong, nonatomic) IBOutlet UITextField *latutudeTextField;
@property (strong, nonatomic) IBOutlet UITextField *longitudeTextField;
@property (strong, nonatomic) IBOutlet UISwitch *useManualCoordinatesSwitch;

@property (strong, nonatomic) IBOutlet UIButton *confirmButton;

@end

@implementation CoordinatesViewController {
    BOOL isLatitudeCorrect;
    BOOL isLongitudeCorrect;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    isLatitudeCorrect = YES;
    isLongitudeCorrect = YES;
    
    if(self.locationCtrl.gpsAvailable) {
        if(self.locationCtrl.coordinatesUsageStatus == CoordinatesUsageStatusGPS) {
            [self.useManualCoordinatesSwitch setOn: NO];
            [self.latutudeTextField setEnabled: NO];
            [self.longitudeTextField setEnabled: NO];
        }
        else if(self.locationCtrl.coordinatesUsageStatus == CoordinatesUsageStatusManual) {
            [self.useManualCoordinatesSwitch setOn: YES];
            [self.latutudeTextField setEnabled: YES];
            [self.longitudeTextField setEnabled: YES];
        }
    }
    else {
        // manual mode without the possibility of switching
        [self.useManualCoordinatesSwitch setOn:YES];
        [self.useManualCoordinatesSwitch setEnabled:NO];
    }
    
    [self.latutudeTextField setText: [NSString stringWithFormat:@"%g", self.locationCtrl.latitude]];
    [self.longitudeTextField setText: [NSString stringWithFormat:@"%g", self.locationCtrl.longitude]];
}

- (void) setLocationController: (LocationController*) controller {
    self.locationCtrl = controller;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction) onLatitudeClearButton {
    if(self.latutudeTextField.isEnabled)
        [self.latutudeTextField setText:nil];
}

- (IBAction) onLongitudeClearButton {
    if(self.longitudeTextField.isEnabled)
        [self.longitudeTextField setText:nil];
}

- (IBAction) onLatitudeTextEditing {
    double value = [self.latutudeTextField.text doubleValue];
    BOOL newCorrect = [self.locationCtrl isCorrectLatitude:value];
    
    if(isLatitudeCorrect && newCorrect == NO) {
        isLatitudeCorrect = NO;
        self.latutudeTextField.textColor = UIColor.redColor;
        [self.confirmButton setEnabled: NO];
    }
    else if(isLatitudeCorrect == NO && newCorrect == YES) {
        isLatitudeCorrect = YES;
        self.latutudeTextField.textColor = UIColor.blackColor;
        if(isLongitudeCorrect)
            [self.confirmButton setEnabled: YES];
    }
}

- (IBAction) onLongitudeTextEditing {
    double value = [self.longitudeTextField.text doubleValue];
    BOOL newCorrect = [self.locationCtrl isCorrectLongitude:value];
    
    if(isLongitudeCorrect && newCorrect == NO) {
        isLongitudeCorrect = NO;
        self.longitudeTextField.textColor = UIColor.redColor;
        [self.confirmButton setEnabled: NO];
    }
    else if(isLongitudeCorrect == NO && newCorrect == YES) {
        isLongitudeCorrect = YES;
        self.longitudeTextField.textColor = UIColor.blackColor;
        if(isLatitudeCorrect)
            [self.confirmButton setEnabled: YES];
    }
}

- (IBAction) onUseGPSCoordinatesSwitch {
    if(self.locationCtrl.gpsAvailable) {
        [self.confirmButton setEnabled: YES];
        
        BOOL enabled = self.useManualCoordinatesSwitch.isOn;
        [self.latutudeTextField setEnabled: enabled];
        [self.longitudeTextField setEnabled: enabled];
        if(!enabled) {
            // show GPS data
            [self.latutudeTextField setText: [NSString stringWithFormat:@"%g", self.locationCtrl.getGPSLatitude]];
            [self.longitudeTextField setText: [NSString stringWithFormat:@"%g",
                self.locationCtrl.getGPSLongitude]];
        }
    }
}

- (IBAction) onConfirmButton {
    if(self.useManualCoordinatesSwitch.isOn) {
        [self.locationCtrl useManualCoordinates];
        [self.locationCtrl setManualLatitude: [self.latutudeTextField.text doubleValue]
                                 andLongitude: [self.longitudeTextField.text doubleValue]];
    }
    else {
        [self.locationCtrl useCoordinatesFromGPS];
    }
}

@end
