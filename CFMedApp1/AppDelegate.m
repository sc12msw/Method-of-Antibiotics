//
//  AppDelegate.m
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import "AppDelegate.h"
#import "FileManager.h"
@interface AppDelegate (){
    NSMutableData *dataBuffer;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    // Change the url string to the site address.
    // The following block GETS the xml file from the restful service.
    NSString *url = @"http://192.168.0.12:8080/cfmedicine/rest/cfmed";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
  
    NSMutableData *data = [[NSMutableData alloc]init];
    dataBuffer =[[NSMutableData alloc]init];
    [self connection:urlConnection didReceiveData:data];
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    return YES;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //Appends the global variable for each chunk of data recieved from the server to download the complete file.
    [dataBuffer appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection*) connection{
    //Gets the incoming data loads it into a string and saves it to the file in the main bundle.
    NSString *xmlStr = [[NSString alloc] initWithData:dataBuffer encoding:NSUTF8StringEncoding];
    NSString *filePath = [FileManager dataFilePath:true];
    NSError *error;
    NSData *data2 = [xmlStr dataUsingEncoding:NSUTF8StringEncoding];
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data2
                                                           options:0 error:&error];
    data2 = doc.XMLData;
    [data2 writeToFile:filePath atomically:YES];
}

- (BOOL) isFirstRun
{
    //Stores the a variable which shows if the application has been run for the first time.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"isFirstRun"])
    {
        return NO;
    }
    
    [defaults setObject:[NSDate date] forKey:@"isFirstRun"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
