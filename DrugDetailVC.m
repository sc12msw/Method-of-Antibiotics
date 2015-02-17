//
//  DrugDetailVC.m
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import "DrugDetailVC.h"

@interface DrugDetailVC ()

@end

@implementation DrugDetailVC
@synthesize drug;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = drug.getGenericName;
    [self fillLabels:@"Oral"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)adminSelector:(id)sender {
}

// Method of the button to show adult information for the drug.
- (IBAction)toggleAdult:(id)sender {
    _adultSwitch.selected = TRUE;
//    _adultSwitch.enabled = FALSE;
    _paedSwitch.selected = FALSE;
//    _paedSwitch.enabled = TRUE;

    [self fillLabels:@"Oral"];
}


// Method to populate the view with data.
- (void) fillLabels :(NSString*) administrationType{
    if ([administrationType  isEqual: @"Oral"]){
    self.treatmentOf.text = [drug.getTreatmentOf componentsJoinedByString:@" "];
    self.sideEffects.text = [drug.getSideEffects componentsJoinedByString:@" "];
    self.interactions.text = [drug.getDrugInteraction componentsJoinedByString:@" "];
    self.administration.text = drug.getOralAdultDetail;
    self.brandNames.text = [drug.getBrandNames componentsJoinedByString:@" "];
    }
}

//Method to the button to show the paediatric information for the drug.
- (IBAction)togglePaed:(id)sender {
    _paedSwitch.selected = TRUE;
  //  _paedSwitch.enabled = FALSE;
    _adultSwitch.selected = FALSE;
 //   _adultSwitch.enabled = TRUE;

}
@end