//
//  DrugTableVC.m
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import "DrugTableVC.h"
#import "DrugDetailVC.h"
#import "Drug.h"
#import "DataParser.h"
#import "AppDelegate.h"
@interface DrugTableVC(){
    NSMutableArray *drugs;
}

@end

@implementation DrugTableVC
@synthesize drugTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    drugs = [[NSMutableArray alloc]init];
    drugs  = [DataParser loadDrugData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//Sets up table rows and populates the table.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [drugs count];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

//Fills cells with data.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Drug *drugObject;
    static NSString *simpleTableIdentifier = @"DrugCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    drugObject = [drugs objectAtIndex:indexPath.row];
    NSString *temp = drugObject.getGenericName;
    NSString *newString = [[temp componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@" "];
    cell.textLabel.text = newString;
    return cell;
}

//Sends the drug object to the detail view.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DrugSegue"]) {
        NSIndexPath *indexPath = [self.drugTable indexPathForSelectedRow];
        DrugDetailVC *dvc = segue.destinationViewController;
        dvc.drug = [drugs objectAtIndex:indexPath.row];
    }
}
@end
