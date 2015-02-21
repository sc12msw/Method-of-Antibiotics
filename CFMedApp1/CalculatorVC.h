//
//  CalculatorVC.h
//  CFMedApp1
//
//  Created by Matt Watson on 21/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorVC : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *calculatorOutput;
- (IBAction)seven:(id)sender;
- (IBAction)eight:(id)sender;
- (IBAction)nine:(id)sender;
- (IBAction)subtract:(id)sender;
- (IBAction)del:(id)sender;
- (IBAction)clear:(id)sender;
- (IBAction)add:(id)sender;
- (IBAction)six:(id)sender;
- (IBAction)five:(id)sender;
- (IBAction)four:(id)sender;
- (IBAction)one:(id)sender;
- (IBAction)two:(id)sender;
- (IBAction)three:(id)sender;
- (IBAction)multiply:(id)sender;
- (IBAction)equals:(id)sender;
- (IBAction)point:(id)sender;
- (IBAction)zero:(id)sender;
- (IBAction)divide:(id)sender;




@end
