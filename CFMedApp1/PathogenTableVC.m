//
//  PathogenTableVC.m
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import "PathogenTableVC.h"
#import "PathogenDetailVC.h"
#import "Pathogen.h"
#import "DataParser.h"
@interface PathogenTableVC (){
NSMutableArray *pathogens;
NSArray *sorter;
}


@end

@implementation PathogenTableVC
@synthesize pathogenTable;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    pathogens = [[NSMutableArray alloc]init];
    pathogens = [DataParser loadPathogenData:@"notForTreatment"];
    sorter = [pathogens sortedArrayUsingComparator:^NSComparisonResult(Pathogen *a, Pathogen *b) {
        return [a.getName caseInsensitiveCompare:b.getName];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//Sets up table rows and populates the table.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [sorter count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

//Fills each cell with data
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"PathogenCell";
    Pathogen *pathogenObject;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    pathogenObject = [sorter objectAtIndex:indexPath.row];
    cell.textLabel.text = pathogenObject.getName;
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//Sends the pathogen object to the detail view.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"PathogenSegue"]) {
        NSIndexPath *indexPath = [self.pathogenTable indexPathForSelectedRow];
        PathogenDetailVC *dvc = segue.destinationViewController;
        dvc.pathogen = [sorter objectAtIndex:indexPath.row];
    }

}
@end
