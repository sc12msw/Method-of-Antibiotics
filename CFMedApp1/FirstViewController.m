//
//  FirstViewController.m
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import "FirstViewController.h"
#import "DrugDetailVC.h"
#import "Drug.h"

@interface FirstViewController (){
    NSArray *drugs;
}

@end

@implementation FirstViewController
@synthesize drugTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    Drug *drugObject = [[Drug alloc]init];;
    drugs = [NSArray arrayWithObjects:drugObject,drugObject, nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Drug *drugObject;
    static NSString *simpleTableIdentifier = @"DrugCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    drugObject = [drugs objectAtIndex:indexPath.row];
    cell.textLabel.text = drugObject.getGenericName;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DrugSegue"]) {
        NSIndexPath *indexPath = [self.drugTable indexPathForSelectedRow];
        DrugDetailVC *dvc = segue.destinationViewController;
        dvc.drug = [drugs objectAtIndex:indexPath.row];
    }
}
@end
