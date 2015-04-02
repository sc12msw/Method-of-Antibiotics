//
//  PathogenDetailVC.m
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//


#import "PathogenDetailVC.h"
#import "Pathogen.h"
#import "Drug.h"
#import "DataParser.h"

@interface PathogenDetailVC (){
    NSMutableArray *drugSelectionStorage;
    NSMutableArray *interactionStorage;
}
@end

@implementation PathogenDetailVC
@synthesize pathogen, firstLinePicker;
@synthesize picker1Data;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = pathogen.getName;
    self.descriptionArea.text = pathogen.getDescription;
    drugSelectionStorage = [[NSMutableArray alloc]init];
    interactionStorage = [[NSMutableArray alloc]init];
    picker1Data = [[NSMutableArray alloc]init];
    [picker1Data addObjectsFromArray:pathogen.getFirstLine];
    
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

//Button to add drugs to the interaction checking list
- (IBAction)selectFL:(id)sender {
    NSInteger row;
    NSString *drug,*textAreaStr;
    row = [firstLinePicker selectedRowInComponent:0];
    drug = [picker1Data objectAtIndex:row];
    [drugSelectionStorage addObject:drug];
    textAreaStr = [drugSelectionStorage componentsJoinedByString:@"\n"];
    self.drugSelection.text = textAreaStr;
    NSMutableArray *drugs = [[NSMutableArray alloc]init];
    drugs  = [DataParser loadDrugData];
    for (Drug *drugObj in drugs){
        NSString *drugObjName = [drugObj getGenericName];
        if ([drugObjName isEqualToString:drug]){
            [interactionStorage addObject:drugObj];
        }
    }
}

//Button to compare interactions

- (IBAction)checkInter:(id)sender {
    
    
    //Checks if there are enough drugs selected to check for interactions
    // then it loops through the drugs selected and checks the name of each drug with the interactions of each drug to find interactions.
    if ([interactionStorage count]<2){
        UIAlertView *interactionAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                   message:@"You need to have at least two drugs to check interactions."
                                                                  delegate:self
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil];
        
        [interactionAlert show];
        
        
    }else{
        
        for (Drug *drugObj in interactionStorage){
            NSString *drugName = [drugObj getGenericName];
            for (Drug *drugObj2 in interactionStorage){
                if (![drugObj2.getGenericName isEqualToString:drugName]){
                    NSDictionary *drugInteractions =[drugObj2 getDrugInteraction];
                    if ([drugInteractions objectForKey:drugName]!=nil){
                        NSString *interactingDrugName = [NSString stringWithFormat:@"%@ interacts with %@.",drugName,drugObj2.getGenericName];
                        UIAlertView *interactionAlert = [[UIAlertView alloc] initWithTitle:@"Interaction found"
                                                                                   message:interactingDrugName
                                                                                  delegate:self
                                                                         cancelButtonTitle:@"OK"
                                                                         otherButtonTitles:nil];
                        
                        [interactionAlert show];
                    }
                }
            }
        }
        
    }
}
@end