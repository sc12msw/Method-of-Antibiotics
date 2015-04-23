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
    
    
    [self.tabBarController.tabBar setHidden:YES];
   [_disclaimerText setContentOffset:CGPointZero animated:YES];
    
}


- (IBAction)disclaimerBtn:(id)sender {
    [self.tabBarController.tabBar setHidden:NO];
    [self.disclaimerBtnObj setHidden:YES];
    NSMutableArray* newArray = [NSMutableArray arrayWithArray:self.tabBarController.viewControllers];
    [newArray removeObject:self];
    [self.tabBarController setViewControllers:newArray animated:YES];
}
@end
