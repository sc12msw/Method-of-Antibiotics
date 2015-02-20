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
@synthesize adminBarDisplay;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = drug.getGenericName;
    [self fillLabels:@"Oral_Adult"];
    [self adultSetting];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Changes the layout for adult setting.
- (void)adultSetting{
    if (drug.isAdult){
        if (!drug.isOralAdult){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:0];
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:0];
        
        if (!drug.isIVAdult){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:1];
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:1];
        
        if (!drug.isInhaledAdult){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:2];
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:2];
        
        if (!drug.isIMAdult){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:3];
        }
         else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:3];
        
        if (!drug.isPRAdult){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:4];
        }
         else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:4];
        
        if (!drug.isSCAdult){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:5];
        }
         else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:5];
    }
}

//Changes the layout for paediatric setting.
-(void) paedSetting{
    if (drug.isPaediatric){
        if (!drug.isOralPaed){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:0];
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:0];
        
        if (!drug.isIVPaed){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:1];
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:1];
        
        if (!drug.isInhaledPaed){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:2];
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:2];
        
        if (!drug.isIMPaed){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:3];
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:3];
        
        if (!drug.isPRPaed){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:4];
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:4];
        
        if (!drug.isSCPaed){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:5];
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:5];
    }

    
}

//Sets the infomation based on which buttons are toggled.
- (void) buttonLogic {
    switch (self.adminBarDisplay.selectedSegmentIndex)
    {
        case 0:
            if ((drug.isOralAdult) && (self.adultSwitch.selected)){
                self.administration.text = drug.getOralAdultDetail;
            }else if ((drug.isOralPaed) && (self.paedSwitch.selected)){
                self.administration.text = drug.getOralPaedDetail;
            }
            break;
            
        case 1:
            if ((drug.isIVAdult) && (self.adultSwitch.selected)){
                self.administration.text = drug.getIVAdultDetail;
            }else if ((drug.isIVPaed) && (self.paedSwitch.selected)){
                self.administration.text = drug.getIVPaedDetail;
                break;
            }
            
        case 2:
            if ((drug.isInhaledAdult) && (self.adultSwitch.selected)){
                self.administration.text = drug.getInhaledAdultDetail;
            }else if ((drug.isInhaledPaed) && (self.paedSwitch.selected)){
                self.administration.text = drug.getInhaledPaedDetail;
            }
            break;
            
        case 3:
            if ((drug.isIMAdult) && (self.adultSwitch.selected)){
                self.administration.text = drug.getIMAdultDetail;
            }else if ((drug.isIMPaed) && (self.paedSwitch.selected)){
                self.administration.text = drug.getIMPaedDetail;
                break;
            }
            
        case 4:
            if ((drug.isPRAdult) && (self.adultSwitch.selected)){
                self.administration.text = drug.getPRAdultDetail;
            }else if ((drug.isPRPaed) && (self.paedSwitch.selected)){
                self.administration.text = drug.getPRPaedDetail;
            }
            break;
    
        case 5:
            if ((drug.isSCAdult) && (self.adultSwitch.selected)){
                self.administration.text = drug.getSCAdultDetail;
            }else if ((drug.isSCPaed) && (self.paedSwitch.selected)){
                self.administration.text = drug.getSCPaedDetail;
                break;
            }



        default:
            break;
    }
}

//Method of the segmented bar button.
- (IBAction)adminTypeBar:(id)sender {
    [self buttonLogic];
   }

// Method of the button to show adult information for the drug.
- (IBAction)toggleAdult:(id)sender {
    self.adultSwitch.selected = TRUE;
    self.paedSwitch.selected = FALSE;
    [self buttonLogic];
    [self adultSetting];
}

//Method to the button to show the paediatric information for the drug.
- (IBAction)togglePaed:(id)sender {
    self.paedSwitch.selected = TRUE;
    self.adultSwitch.selected = FALSE;
    [self buttonLogic];
    [self paedSetting];
}

// Method to populate the view with data based on route of administration.
- (void) fillLabels :(NSString*) administrationType{
    if ([administrationType  isEqual: @"Oral_Adult"]){
    self.treatmentOf.text = [drug.getTreatmentOf componentsJoinedByString:@" "];
    self.sideEffects.text = [drug.getSideEffects componentsJoinedByString:@" "];
    self.interactions.text = [drug.getDrugInteraction componentsJoinedByString:@" "];
        if (drug.isOralAdult){
            self.administration.text = drug.getOralAdultDetail;
        }else self.administration.text = @"N/A";

    self.brandNames.text = [drug.getBrandNames componentsJoinedByString:@" "];
    }
}


@end