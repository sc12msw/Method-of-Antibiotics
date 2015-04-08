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
    if ([drugSelectionStorage containsObject:drug]){
        UIAlertView *interactionAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                   message:@"You cannot add the same drug twice."
                                                                  delegate:self
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil];
        
        [interactionAlert show];
        
    }else{
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
}

//Button to compare interactions

- (IBAction)checkInter:(id)sender {
    
    
    //Checks if there are enough drugs selected to check for interactions
    if ([interactionStorage count]<2){
        UIAlertView *interactionAlert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                   message:@"You need to have at least two drugs to check interactions."
                                                                  delegate:self
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil];
        
        [interactionAlert show];
        
        
    }else{
        //Arrays to store the names of the drugs affected. This is to avoid the problem of A=B and B=A being displayed as it is only needed once.
        NSMutableArray *drugA = [[NSMutableArray alloc]init];
        NSMutableArray *drugB = [[NSMutableArray alloc]init];
        
        
        // Loops through the drugs selected and checks the name of each drug with the interactions of each drug to find interactions.
        for (Drug *drugObj in interactionStorage){
            NSString *drugName = [drugObj getGenericName];
            for (Drug *drugToCheck in interactionStorage){
                if (![drugToCheck.getGenericName isEqualToString:drugName]){
                    NSDictionary *drugInteractions =[drugToCheck getDrugInteraction];
                    if ([drugInteractions objectForKey:drugName]!=nil){
                        [drugA addObject:drugObj];
                        [drugB addObject:drugToCheck];
                    }
                }
            }
        }
        
        //Loops through A and B. Compares all A = B strings to B = A if they are the same that index is removed.
        for (int i=0; i<[drugA count ]; i++){
            NSString *temp = [NSString stringWithFormat:@"%@ interacts with %@.",[[drugA objectAtIndex:i] getGenericName],[[drugB objectAtIndex:i] getGenericName]];;
            for (int j= i; j<[drugA count]; j++) {
                NSString *compare = [NSString stringWithFormat:@"%@ interacts with %@.",[[drugB objectAtIndex:j] getGenericName],[[drugA objectAtIndex:j]getGenericName]];
                if ([temp isEqualToString:compare]){
                    [drugA removeObjectAtIndex:j];
                    [drugB removeObjectAtIndex:j];
                }
            }
            
        }
        
        for (int i=0; i<[drugA count]; i++){
            NSString *interactingDrugName = [NSString stringWithFormat:@"%@ interacts with %@. \n Description: %@",[[drugA objectAtIndex:i] getGenericName],[[drugB objectAtIndex:i] getGenericName], [[[drugA objectAtIndex:i] getDrugInteraction] objectForKey:[[drugB objectAtIndex:i] getGenericName]]];
            UIAlertView *interactionAlert = [[UIAlertView alloc] initWithTitle:@"Interaction found"
                                                                       message:interactingDrugName
                                                                      delegate:self
                                                             cancelButtonTitle:@"OK"
                                                             otherButtonTitles:nil];
            
            [interactionAlert show];
            
            
            
        }
        
        
    }
}

- (IBAction)removeDrug:(id)sender {
    [drugSelectionStorage removeLastObject];
    NSString *textAreaStr = [drugSelectionStorage componentsJoinedByString:@"\n"];
    self.drugSelection.text = textAreaStr;
}
@end