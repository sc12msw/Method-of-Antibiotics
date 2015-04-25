//
//  disclaimerVC.m
//  CFMedApp1
//
//  Created by Matt Watson on 25/03/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import "DisclaimerVC.h"


@interface DisclaimerVC ()

@end

@implementation DisclaimerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //Removes the tab bar from the first screen and sets the text to the top so user can scroll down if needed
    [self.tabBarController.tabBar setHidden:YES];
   [_disclaimerText scrollRangeToVisible: NSMakeRange(0, 1)];
    
}

//Removes the view from the tab bar controller on accept as the user has read the disclaimer
- (IBAction)disclaimerBtn:(id)sender {
    [self.tabBarController.tabBar setHidden:NO];
    [self.disclaimerBtnObj setHidden:YES];
    NSMutableArray* newArray = [NSMutableArray arrayWithArray:self.tabBarController.viewControllers];
    [newArray removeObject:self];
    [self.tabBarController setViewControllers:newArray animated:YES];
}
@end
