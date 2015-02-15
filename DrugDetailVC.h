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
@property (strong, nonatomic) IBOutlet UILabel *treatmentOf;
@property (strong, nonatomic) IBOutlet UILabel *brandNames;
@property (strong, nonatomic) IBOutlet UILabel *sideEffects;
@property (strong, nonatomic) IBOutlet UILabel *interactions;
@property (strong, nonatomic) IBOutlet UILabel *administration;

- (IBAction)toggleAdult:(id)sender;
- (IBAction)togglePaed:(id)sender;

@end