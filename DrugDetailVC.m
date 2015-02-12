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
@synthesize drugLabel;
@synthesize drug;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.drugLabel.text = drug.getGenericName;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end