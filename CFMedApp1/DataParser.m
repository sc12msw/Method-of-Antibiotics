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




+(NSMutableArray *)loadDrugData {
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"xml"];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData
                                                           options:0 error:&error];
    if (doc == nil) { return nil; }
    
    NSLog(@"%@", doc.rootElement);
    
    Drug *drug = [[Drug alloc]init];
    NSString *temp = nil;
    NSMutableArray *tempList = [[NSMutableArray alloc]init];

    NSMutableArray *drugObjects = [[NSMutableArray alloc]init];
    
    //String variables for doeses and administration.
    
    //Gets all the drugs from the xml file
    NSArray *drugs = [doc.rootElement elementsForName:@"drug"];
    for (GDataXMLElement *obj in drugs){
        NSArray *drugNames = [obj elementsForName:@"name"];
        if (drugs.count > 0) {
            GDataXMLElement *drugXML = (GDataXMLElement *) [drugNames objectAtIndex:0];
            temp = drugXML.stringValue;
            [drug setGenericName:temp];
        }
        
        
        //Gets the types for the drugs from the xml file
        NSArray *types =[obj elementsForName:@"type"];
        if (types.count >0){
            GDataXMLElement *typeXML = (GDataXMLElement *) [types objectAtIndex:0];
            temp = typeXML.stringValue;
            [drug setTypeofDrug:temp];
        }
        
        //Gets the side effects for the drugs from the xml file
        NSArray *sideEffects =[obj elementsForName:@"side_effects"];
        if (sideEffects.count >0){
            for (GDataXMLElement *sEObj in sideEffects){
                GDataXMLElement *sideEffectXML = (GDataXMLElement *) sEObj;
                temp = sideEffectXML.stringValue;
                [tempList addObject:temp];
                
            }
            [drug setSideEffects:tempList];
            tempList=[[NSMutableArray alloc]init];
        }
        
        //Gets the interactions for the drugs from the xml file
        NSArray *interactions =[obj elementsForName:@"interactions"];
        if (interactions.count >0){
            for (GDataXMLElement *interactObj in interactions){
                GDataXMLElement *interactionXML = (GDataXMLElement *) interactObj;
                temp = interactionXML.stringValue;
                [tempList addObject:temp];
            }
            [drug setDrugInteraction:tempList];
            tempList=[[NSMutableArray alloc]init];
        }
        
        //Gets the brand names for the drugs from the xml file
        NSArray *brandNames =[obj elementsForName:@"brand_name"];
        if (brandNames.count >0){
            for (GDataXMLElement *brandObj in brandNames){
                GDataXMLElement *brandXML = (GDataXMLElement *) brandObj;
                temp = brandXML.stringValue;
                [tempList addObject:temp];
            }
            [drug setBrandNames:tempList];
            tempList=[[NSMutableArray alloc]init];
        }
        
        //Gets the indications from the xml file
        NSArray *indications =[obj elementsForName:@"indication"];
        if (indications.count >0){
                GDataXMLElement *treatXML = (GDataXMLElement *) [indications objectAtIndex:0];
                temp = treatXML.stringValue;
            [drug setIndication:temp];
        }
        
        //Checks for the adult detail from the xml file
        NSArray *adult =[obj elementsForName:@"adult"];
        if (adult.count >0){
            for (GDataXMLElement *adultObj in adult){
                GDataXMLElement *adultXML = (GDataXMLElement *) adultObj;
                NSArray *children= [[NSArray alloc]init];
                children = adultXML.children;
                
                
            }
        }
    
        [drugObjects addObject:drug];
        //To prevent overwriting of the object and clear arrays
        drug = [[Drug alloc] init];
    }
    return drugObjects;
    
}

@end
