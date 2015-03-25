//
//  disclaimerVC.h
//  CFMedApp1
//
//  Created by Matt Watson on 25/03/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisclaimerVC :UIViewController
@property (strong, nonatomic) IBOutlet UITextView *disclaimerText;
- (IBAction)disclaimerBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *disclaimerBtnObj;

@end
