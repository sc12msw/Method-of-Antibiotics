//
//  PathogenDetailVC.m
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//


#import "PathogenDetailVC.h"

@interface PathogenDetailVC ()

@end

@implementation PathogenDetailVC

@synthesize pathogen;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pathogenLabel.text = pathogen.getName;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end