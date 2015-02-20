//
//  DrugDetailVC.h
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drug.h"
@interface DrugDetailVC : UIViewController

@property (strong, nonatomic) Drug *drug;
@property (strong, nonatomic) IBOutlet UIButton *adultSwitch;
@property (strong, nonatomic) IBOutlet UIButton *paedSwitch;
@property (strong, nonatomic) IBOutlet UITextView *treatmentOf;
@property (strong, nonatomic) IBOutlet UITextView *brandNames;
@property (strong, nonatomic) IBOutlet UITextView *sideEffects;
@property (strong, nonatomic) IBOutlet UITextView *interactions;
@property (strong, nonatomic) IBOutlet UITextView *administration;
@property (strong, nonatomic) IBOutlet UISegmentedControl *adminBarDisplay;

- (IBAction)adminTypeBar:(id)sender;

- (IBAction)toggleAdult:(id)sender;
- (IBAction)togglePaed:(id)sender;

@end