//
//  PathogensForDrug.m
//  CFMedApp1
//
//  Created by Matt Watson on 01/04/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import "PathogensForDrugVC.h"
#import "Pathogen.h"
#import "DataParser.h"
#import "PathogenDetailVC.h"

@interface PathogensForDrugVC (){
    NSMutableArray *pathogens;
}
@end


@implementation PathogensForDrugVC
@synthesize drug;
@synthesize pathogenTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    //Gets the drug name from the previous view and specifies it only wants pathogens which can be treated by that drug.
    NSString* pathoForDrug =drug.getGenericName;
    pathogens = [[NSMutableArray alloc]init];
    pathogens = [DataParser loadPathogenData:pathoForDrug];
}



//Sets up table rows and populates the table.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [pathogens count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"PathogenCell";
    Pathogen *pathogenObject;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    pathogenObject = [pathogens objectAtIndex:indexPath.row];
    cell.textLabel.text = pathogenObject.getName;
    return cell;
}

//Allows data to be passed to detailed cell view, prepare the segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"drugPathogenSegue"]) {
        NSIndexPath *indexPath = [self.pathogenTable indexPathForSelectedRow];
        PathogenDetailVC *dvc = segue.destinationViewController;
        dvc.pathogen = [pathogens objectAtIndex:indexPath.row];
    }
}

@end
