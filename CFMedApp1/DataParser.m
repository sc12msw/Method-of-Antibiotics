//
//  DataParser.m
//  CFMedApp1
//
//  Created by Matt Watson on 23/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import "DataParser.h"
#import "GDataXMLNode.h"
#import "Drug.h"
@implementation DataParser

+ (NSString *)dataFilePath {
    return [[NSBundle mainBundle] pathForResource:@"example" ofType:@"xml"];
}

+ (NSMutableArray *)loadData {
    
    NSString *filePath = [self dataFilePath];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData
                                                           options:0 error:&error];
    if (doc == nil) { return nil; }
    
    NSLog(@"%@", doc.rootElement);
    
    
    
    return nil;
    
}

@end
