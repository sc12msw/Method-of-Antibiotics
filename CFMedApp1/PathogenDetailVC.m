//
//  PathogenDetailVC.m
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//


#import "PathogenDetailVC.h"
#import "Pathogen.h"

@interface PathogenDetailVC (){
    NSMutableArray *drugSelectionStorage;
}
@end

@implementation PathogenDetailVC
@synthesize pathogen, firstLinePicker;
@synthesize picker1Data;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = pathogen.getName;
    self.descriptionArea.text = pathogen.getDescription;
    self.descriptionArea.textColor = [UIColor whiteColor];
    drugSelectionStorage = [[NSMutableArray alloc]init];
    picker1Data = [[NSMutableArray alloc]init];
    [picker1Data addObjectsFromArray:pathogen.getFirstLine];
    [picker1Data addObjectsFromArray:pathogen.getSecondLine];
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
   
        
    return picker1Data.count;
    
   
}
//3
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [picker1Data objectAtIndex:row];
    
  
}

- (IBAction)selectFL:(id)sender {
    NSInteger row;
    NSString *drug,*textAreaStr;
    row = [firstLinePicker selectedRowInComponent:0];
    drug = [picker1Data objectAtIndex:row];
    [drugSelectionStorage addObject:drug];
    textAreaStr = [drugSelectionStorage componentsJoinedByString:@"\n"];
    self.drugSelection.text = textAreaStr;
    
}



@end