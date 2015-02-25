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



+(NSMutableArray *)loadData {
    Drug *drug = [[Drug alloc]init];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"xml"];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData
                                                           options:0 error:&error];
    if (doc == nil) { return nil; }
    
    NSLog(@"%@", doc.rootElement);
    
    int currentIndex =0;
    NSString *temp;
    
    //Gets all the drugs from the xml file
    NSArray *drugs = [doc.rootElement elementsForName:@"drug"];
    for (GDataXMLElement *obj in drugs){
        NSArray *drugNames = [obj elementsForName:@"name"];
        if (drugs.count > 0) {
            GDataXMLElement *drugXML = (GDataXMLElement *) [drugNames objectAtIndex:currentIndex];
            temp = drugXML.stringValue;
            [drug setGenericName:temp];
        }
     
    //Gets the types for the drugs from the xml file
        NSArray *types =[obj elementsForName:@"type"];
        if (types.count >0){
            for (GDataXMLElement *typeObj in types){
                GDataXMLElement *typeXML = (GDataXMLElement *) typeObj;
                temp = typeXML.stringValue;
            }
            [drug setIndication:temp];

            [drug setTypeofDrug:temp];
        }
        
     //Gets the side effects for the drugs from the xml file
        NSArray *sideEffects =[obj elementsForName:@"side_effects"];
        NSMutableArray *sideEffectList = [[NSMutableArray alloc]init];
        if (sideEffects.count >0){
            for (GDataXMLElement *sEObj in sideEffects){
            GDataXMLElement *sideEffectXML = (GDataXMLElement *) sEObj;
            temp = sideEffectXML.stringValue;
            [sideEffectList addObject:temp];
            }
            [drug setSideEffects:sideEffectList];
        }
        
        //Gets the interactions for the drugs from the xml file
        NSMutableArray *interactionList = [[NSMutableArray alloc]init];
        NSArray *interactions =[obj elementsForName:@"warning"];
        if (interactions.count >0){
            for (GDataXMLElement *interactObj in interactions){
                GDataXMLElement *interactionXML = (GDataXMLElement *) interactObj;
                temp = interactionXML.stringValue;
                [interactionList addObject:temp];
            }
            [drug setDrugInteraction:interactionList];
        }
        
       //Gets the pathogens the drug treats from the xml file
        NSArray *treatmentsFor =[obj elementsForName:@"indication"];
        if (treatmentsFor.count >0){
            for (GDataXMLElement *treatObj in treatmentsFor){
                GDataXMLElement *treatXML = (GDataXMLElement *) treatObj;
                temp = treatXML.stringValue;
            }
            [drug setIndication:temp];
            
        }
        

        
        currentIndex = currentIndex +1;
    }
    
    return nil;
    
}

@end
