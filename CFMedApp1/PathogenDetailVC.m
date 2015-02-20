//
//  PathogenDetailVC.m
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//


#import "PathogenDetailVC.h"
#import "Pathogen.h"

@interface PathogenDetailVC ()
@end

@implementation PathogenDetailVC
@synthesize pathogen, firstLinePicker;
@synthesize pickerData;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = pathogen.getName;
    self.descriptionArea.text = pathogen.getDescription;
    pickerData = pathogen.getFirstLine;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Set of methods needed for picker to run. First sets number of columns second rows and third places objects into rows.
//1
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
//2
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *firstLine = pathogen.getFirstLine;
    return firstLine.count;
}
//3
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *firstLine = pathogen.getFirstLine;
    return [firstLine objectAtIndex:row];
}

- (IBAction)selectFL:(id)sender {
    NSInteger row;
    NSString *drug;
    row = [firstLinePicker selectedRowInComponent:0];
    drug = [pickerData objectAtIndex:row];
    
}
@end