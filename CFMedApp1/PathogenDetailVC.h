//
//  PathogenDetailVC.h
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pathogen.h"
@interface PathogenDetailVC : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UITextView *descriptionArea;
@property (strong, nonatomic) IBOutlet UIPickerView *firstLinePicker;
@property (strong, nonatomic) Pathogen *pathogen;
- (IBAction)selectFL:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *drugSelection;

@property (strong, nonatomic) NSMutableArray *picker1Data;
@end