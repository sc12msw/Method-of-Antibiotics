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
#import "DataParser.h"
#import "AppDelegate.h"
@interface FirstViewController (){
    NSMutableArray *drugs;
}

@end

@implementation FirstViewController
@synthesize drugTable;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Change the url string to the site address.
    // The following block GETS the xml file from the restful service.
    NSString *url = @"http://192.168.0.12:8080/com.watson.jersey.cfmed/rest/cfmed";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    NSMutableData *data = [[NSMutableData alloc]init];
    [self connection:urlConnection didReceiveData:data];
  
    
   
    
    drugs = [[NSMutableArray alloc]init];
    drugs  = [DataParser loadDrugData];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //Shows the status code so if its 200 the connection was successful.
    NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
    NSLog(@"%ld",statusCode);
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    
    //Gets the incoming data loads it into a string and saves it to the file in the main bundle.
    NSString *xmlStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
   // NSLog(@"%@", xmlStr);
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"storage" ofType:@"xml"];
    NSError *error;
    NSData *data2 = [xmlStr dataUsingEncoding:NSUTF8StringEncoding];
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data2
                                                           options:0 error:&error];
    data2 = doc.XMLData;
    [data2 writeToFile:filePath atomically:YES];
   
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
