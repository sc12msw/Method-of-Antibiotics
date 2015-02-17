//
//  SecondViewController.m
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import "SecondViewController.h"
#import "PathogenDetailVC.h"
#import "Pathogen.h"
@interface SecondViewController (){
NSArray *pathogenList;
}


@end

@implementation SecondViewController
@synthesize pathogenTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    Pathogen *pathogenObject = [[Pathogen alloc]init];;
    pathogenList = [NSArray arrayWithObjects:pathogenObject,pathogenObject, nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Sets up table rows and populates the table.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [pathogenList count];
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
    
    pathogenObject = [pathogenList objectAtIndex:indexPath.row];
    cell.textLabel.text = pathogenObject.getName;
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//Allows data to be passed to detailed cell view, prepare the segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"PathogenSegue"]) {
        NSIndexPath *indexPath = [self.pathogenTable indexPathForSelectedRow];
        PathogenDetailVC *dvc = segue.destinationViewController;
        dvc.pathogen = [pathogenList objectAtIndex:indexPath.row];
    }

}
@end
