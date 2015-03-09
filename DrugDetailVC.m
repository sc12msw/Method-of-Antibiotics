//
//  DrugAdministrationVC.m
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
    [self fillFields];
    [self adultSetting];
    [self buttonLogic];
    //Disables paediatric button if none exists.
    if(!drug.isPaediatric){
        self.paedSwitch.enabled =false;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Changes the layout for adult setting.
- (void)adultSetting{
    
    NSMutableString *title= [[NSMutableString alloc]init];
    [title appendString:drug.getGenericName];
    [title appendString:@" -Adult"];
    self.navigationItem.title = title;
    
    self.adultSwitch.backgroundColor = UIColorFromRGB(0xFF6600);
    self.adultSwitch.titleLabel.textColor = [UIColor whiteColor];
    self.paedSwitch.backgroundColor = [UIColor whiteColor];
    self.paedSwitch.titleLabel.textColor = [UIColor blueColor];
    
    
    if (drug.isAdult){
        if (!drug.isOralAdult){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:0];
            self.administration.text = @"";
            self.doseLabel.text = @"";
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:0];
        
        if (!drug.isIVAdult){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:1];
            self.administration.text = @"";
            self.doseLabel.text = @"";
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:1];
        
        if (!drug.isInhaledAdult){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:2];
            self.administration.text = @"";
            self.doseLabel.text = @"";
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:2];
        
        if (!drug.isIMAdult){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:3];
            self.administration.text = @"";
            self.doseLabel.text = @"";
        }
         else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:3];
        
        if (!drug.isPRAdult){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:4];
            self.administration.text = @"";
            self.doseLabel.text = @"";
        }
         else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:4];
        
        if (!drug.isSCAdult){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:5];
            self.administration.text = @"";
            self.doseLabel.text = @"";
        }
         else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:5];
    }
}

//Changes the layout for paediatric setting.
-(void) paedSetting{
    
    NSMutableString *title= [[NSMutableString alloc] init];
    [title appendString:drug.getGenericName];
    [title appendString:@" -Paediatric"];
    self.navigationItem.title = title;
    
    self.paedSwitch.backgroundColor = UIColorFromRGB(0xFF6600);
    self.paedSwitch.titleLabel.textColor = [UIColor whiteColor];
    self.adultSwitch.backgroundColor = [UIColor whiteColor];
    self.adultSwitch.titleLabel.textColor = [UIColor blueColor];
    
    if (drug.isPaediatric){
        if (!drug.isOralPaed){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:0];
            self.administration.text = @"";
            self.doseLabel.text = @"";
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:0];
        
        if (!drug.isIVPaed){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:1];
            self.administration.text = @"";
            self.doseLabel.text = @"";
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:1];
        
        if (!drug.isInhaledPaed){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:2];
            self.administration.text = @"";
            self.doseLabel.text = @"";
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:2];
        
        if (!drug.isIMPaed){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:3];
            self.administration.text = @"";
            self.doseLabel.text = @"";
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:3];
        
        if (!drug.isPRPaed){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:4];
            self.administration.text = @"";
            self.doseLabel.text = @"";
        }
        else [adminBarDisplay setEnabled:TRUE forSegmentAtIndex:4];
        
        if (!drug.isSCPaed){
            [adminBarDisplay setEnabled:FALSE forSegmentAtIndex:5];
            self.administration.text = @"";
            self.doseLabel.text = @"";
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
                self.administration.text = drug.getOralAdultAdministration;
                self.doseLabel.text = drug.getOralAdultDose;
            }else if ((drug.isOralPaed) && (self.paedSwitch.selected)){
                self.administration.text = drug.getOralPaedAdministration;
                self.doseLabel.text = drug.getOralPaedDose;
            }
            break;
            
        case 1:
            if ((drug.isIVAdult) && (self.adultSwitch.selected)){
                self.administration.text = drug.getIVAdultAdministration;
                self.doseLabel.text = drug.getIVAdultDose;
            }else if ((drug.isIVPaed) && (self.paedSwitch.selected)){
                self.administration.text = drug.getIVPaedAdministration;
                self.doseLabel.text = drug.getIVPaedDose;
                break;
            }
            
        case 2:
            if ((drug.isInhaledAdult) && (self.adultSwitch.selected)){
                self.administration.text = drug.getInhaledAdultAdministration;
                self.doseLabel.text = drug.getInhaledAdultDose;
            }else if ((drug.isInhaledPaed) && (self.paedSwitch.selected)){
                self.administration.text = drug.getInhaledPaedAdministration;
                self.doseLabel.text = drug.getInhaledPaedDose;
            }
            break;
            
        case 3:
            if ((drug.isIMAdult) && (self.adultSwitch.selected)){
                self.administration.text = drug.getIMAdultAdministration;
                self.doseLabel.text = drug.getIMAdultDose;
            }else if ((drug.isIMPaed) && (self.paedSwitch.selected)){
                self.administration.text = drug.getIMPaedAdministration;
                self.doseLabel.text = drug.getIMPaedDose;
                break;
            }
            
        case 4:
            if ((drug.isPRAdult) && (self.adultSwitch.selected)){
                self.administration.text = drug.getPRAdultAdministration;
                self.doseLabel.text = drug.getPRAdultDose;
            }else if ((drug.isPRPaed) && (self.paedSwitch.selected)){
                self.administration.text = drug.getPRPaedAdministration;
                self.doseLabel.text = drug.getPRPaedDose;
            }
            break;
    
        case 5:
            if ((drug.isSCAdult) && (self.adultSwitch.selected)){
                self.administration.text = drug.getSCAdultAdministration;
                self.doseLabel.text = drug.getSCAdultDose;
            }else if ((drug.isSCPaed) && (self.paedSwitch.selected)){
                self.administration.text = drug.getSCPaedAdministration;
                self.doseLabel.text = drug.getSCPaedDose;
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
    [self adultSetting];
    [self buttonLogic];}

//Method to the button to show the paediatric information for the drug.
- (IBAction)togglePaed:(id)sender {
    self.paedSwitch.selected = TRUE;
    self.adultSwitch.selected = FALSE;
    [self paedSetting];
    [self buttonLogic];
}

// Method to populate the view with data based on route of administration.
- (void) fillFields{
   
    self.indication.text = drug.getIndication;
    self.sideEffects.text = [drug.getSideEffects componentsJoinedByString:@" "];
    self.interactions.text = [drug.getDrugInteraction componentsJoinedByString:@" "];
        if (drug.isOralAdult){
            self.administration.text = drug.getOralAdultAdministration;
            self.doseLabel.text = drug.getOralAdultDose;
        }else{
            self.administration.text = @" ";
            self.doseLabel.text =@" ";
        }
    self.brandNames.text = [drug.getBrandNames componentsJoinedByString:@" "];
    
}


@end