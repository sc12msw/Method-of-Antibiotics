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
    
    int currentIndex =0;
    NSString *drugName, *type, *sideEffect,*interaction;
    
    NSArray *drugs = [doc.rootElement elementsForName:@"drug"];
    for (GDataXMLElement *obj in drugs){
        NSArray *drugNames = [obj elementsForName:@"name"];
        if (drugs.count > 0) {
            GDataXMLElement *drugXML = (GDataXMLElement *) [drugNames objectAtIndex:currentIndex];
            drugName = drugXML.stringValue;
        }else continue;
        
        NSArray *types =[obj elementsForName:@"type"];
        if (types.count >0){
            GDataXMLElement *typeXML = (GDataXMLElement *) [types objectAtIndex:currentIndex];
            type = typeXML.stringValue;
        }else continue;
        
        NSArray *sideEffects =[obj elementsForName:@"side_effects"];
        if (sideEffects.count >0){
            GDataXMLElement *sideEffectXML = (GDataXMLElement *) [sideEffects objectAtIndex:currentIndex];
            sideEffect = sideEffectXML.stringValue;
        }else continue;
        
        NSArray *interactions =[obj elementsForName:@"warning"];
        if (interactions.count >0){
            GDataXMLElement *interactionXML = (GDataXMLElement *) [interactions objectAtIndex:currentIndex];
            interaction = interactionXML.stringValue;
        }else continue;
        
        NSArray *treatmentsFor =[obj elementsForName:@"treatment"];
        if (treatmentsFor.count >0){
            GDataXMLElement *treatmentXML = (GDataXMLElement *) [treatmentsFor objectAtIndex:currentIndex];
            interaction = treatmentXML.stringValue;
        }else continue;

        
        currentIndex = currentIndex +1;
    }
    
    return nil;
    
}

@end
