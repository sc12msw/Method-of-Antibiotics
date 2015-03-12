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
#import "Pathogen.h"
#import "FileManager.h"
@implementation DataParser




+(NSMutableArray *)loadDrugData {
    
    NSString *filePath = [FileManager dataFilePath:false];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData
                                                           options:0 error:&error];
    if (doc == nil) { return nil; }
    
   
    
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
        NSArray *sideEffects =[obj elementsForName:@"sideEffect"];
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
        NSArray *brandNames =[obj elementsForName:@"brandName"];
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
            BOOL decision = TRUE;
            [drug setAdult:&decision];
            
            for (GDataXMLElement *adultObj in adult){
                GDataXMLElement *adultXML = (GDataXMLElement *) adultObj;
                NSArray *children= [[NSArray alloc]init];
                NSArray *rOAChildren = [[NSArray alloc]init];
                
                //Gets the nested nodes inside adult
                children = adultXML.children;
                for (GDataXMLNode *childrenObj in children){
                    
                    //Checks which routes of administration are present
                    NSString *routeOfAdmin = childrenObj.name;
                    
                    //Inhaled is set by finding the node then setting the current index 0.admin and 1.dose to set the data to the object
                    if ([routeOfAdmin isEqualToString:@"inhaled"]){
                        rOAChildren = childrenObj.children;
                        int currentIndex = 0;
                        for (GDataXMLElement *rOAObj in rOAChildren){
                            if (currentIndex == 0){
                                temp = rOAObj.stringValue;
                                [drug setInhaledAdultAdministration:temp];
                            }else if (currentIndex == 1){
                                temp = rOAObj.stringValue;
                                [drug setInhaledAdultDose:temp];
                            }
                            currentIndex = currentIndex+1;
                        }
                    }
                    
                    if ([routeOfAdmin isEqualToString:@"oral"]){
                        rOAChildren = childrenObj.children;
                        int currentIndex = 0;
                        for (GDataXMLElement *rOAObj in rOAChildren){
                            if (currentIndex == 0){
                                temp = rOAObj.stringValue;
                                [drug setOralAdultAdministration:temp];
                            }else if (currentIndex == 1){
                                temp = rOAObj.stringValue;
                                [drug setOralAdultDose:temp];
                            }
                            currentIndex = currentIndex+1;
                        }
                    }
                    
                    if ([routeOfAdmin isEqualToString:@"IV"]){
                        rOAChildren = childrenObj.children;
                        int currentIndex = 0;
                        for (GDataXMLElement *rOAObj in rOAChildren){
                            if (currentIndex == 0){
                                temp = rOAObj.stringValue;
                                [drug setIVAdultAdministration:temp];
                            }else if (currentIndex == 1){
                                temp = rOAObj.stringValue;
                                [drug setIVAdultDose:temp];
                            }
                            currentIndex = currentIndex+1;
                        }
                    }
                    
                    if ([routeOfAdmin isEqualToString:@"PR"]){
                        rOAChildren = childrenObj.children;
                        int currentIndex = 0;
                        for (GDataXMLElement *rOAObj in rOAChildren){
                            if (currentIndex == 0){
                                temp = rOAObj.stringValue;
                                [drug setPRAdultAdministration:temp];
                            }else if (currentIndex == 1){
                                temp = rOAObj.stringValue;
                                [drug setPRAdultDose:temp];
                            }
                            currentIndex = currentIndex+1;
                        }
                    }
                    if ([routeOfAdmin isEqualToString:@"SC"]){
                        rOAChildren = childrenObj.children;
                        int currentIndex = 0;
                        for (GDataXMLElement *rOAObj in rOAChildren){
                            if (currentIndex == 0){
                                temp = rOAObj.stringValue;
                                [drug setSCAdultAdministration:temp];
                            }else if (currentIndex == 1){
                                temp = rOAObj.stringValue;
                                [drug setSCAdultDose:temp];
                            }
                            currentIndex = currentIndex+1;
                        }
                    }
                    if ([routeOfAdmin isEqualToString:@"IM"]){
                        rOAChildren = childrenObj.children;
                        int currentIndex = 0;
                        for (GDataXMLElement *rOAObj in rOAChildren){
                            if (currentIndex == 0){
                                temp = rOAObj.stringValue;
                                [drug setIMAdultAdministration:temp];
                            }else if (currentIndex == 1){
                                temp = rOAObj.stringValue;
                                [drug setIMAdultDose:temp];
                            }
                            currentIndex = currentIndex+1;
                        }
                    }
                }
            }
        }
        //////
        
        //Checks for the adult detail from the xml file
        NSArray *paed =[obj elementsForName:@"paediatric"];
        if (paed.count >0){
            BOOL decision = TRUE;
            [drug setPaediatric:&decision];
            
            for (GDataXMLElement *paedObj in paed){
                GDataXMLElement *paedXML = (GDataXMLElement *) paedObj;
                NSArray *children= [[NSArray alloc]init];
                NSArray *rOAChildren = [[NSArray alloc]init];
                
                //Gets the nested nodes inside paed
                children = paedXML.children;
                for (GDataXMLNode *childrenObj in children){
                    
                    //Checks which routes of administration are present
                    NSString *routeOfAdmin = childrenObj.name;
                    
                    //Inhaled is set by finding the node then setting the current index 0.admin and 1.dose to set the data to the object
                    if ([routeOfAdmin isEqualToString:@"inhaled"]){
                        rOAChildren = childrenObj.children;
                        int currentIndex = 0;
                        for (GDataXMLElement *rOAObj in rOAChildren){
                            if (currentIndex == 0){
                                temp = rOAObj.stringValue;
                                [drug setInhaledPaedAdministration:temp];
                            }else if (currentIndex == 1){
                                temp = rOAObj.stringValue;
                                [drug setInhaledPaedDose:temp];
                            }
                            currentIndex = currentIndex+1;
                        }
                    }
                    
                    if ([routeOfAdmin isEqualToString:@"oral"]){
                        rOAChildren = childrenObj.children;
                        int currentIndex = 0;
                        for (GDataXMLElement *rOAObj in rOAChildren){
                            if (currentIndex == 0){
                                temp = rOAObj.stringValue;
                                [drug setOralPaedAdministration:temp];
                            }else if (currentIndex == 1){
                                temp = rOAObj.stringValue;
                                [drug setOralPaedDose:temp];
                            }
                            currentIndex = currentIndex+1;
                        }
                    }
                    
                    if ([routeOfAdmin isEqualToString:@"IV"]){
                        rOAChildren = childrenObj.children;
                        int currentIndex = 0;
                        for (GDataXMLElement *rOAObj in rOAChildren){
                            if (currentIndex == 0){
                                temp = rOAObj.stringValue;
                                [drug setIVPaedAdministration:temp];
                            }else if (currentIndex == 1){
                                temp = rOAObj.stringValue;
                                [drug setIVPaedDose:temp];
                            }
                            currentIndex = currentIndex+1;
                        }
                    }
                    
                    if ([routeOfAdmin isEqualToString:@"PR"]){
                        rOAChildren = childrenObj.children;
                        int currentIndex = 0;
                        for (GDataXMLElement *rOAObj in rOAChildren){
                            if (currentIndex == 0){
                                temp = rOAObj.stringValue;
                                [drug setPRPaedAdministration:temp];
                            }else if (currentIndex == 1){
                                temp = rOAObj.stringValue;
                                [drug setPRPaedDose:temp];
                            }
                            currentIndex = currentIndex+1;
                        }
                    }
                    if ([routeOfAdmin isEqualToString:@"SC"]){
                        rOAChildren = childrenObj.children;
                        int currentIndex = 0;
                        for (GDataXMLElement *rOAObj in rOAChildren){
                            if (currentIndex == 0){
                                temp = rOAObj.stringValue;
                                [drug setSCPaedAdministration:temp];
                            }else if (currentIndex == 1){
                                temp = rOAObj.stringValue;
                                [drug setSCPaedDose:temp];
                            }
                            currentIndex = currentIndex+1;
                        }
                    }
                    if ([routeOfAdmin isEqualToString:@"IM"]){
                        rOAChildren = childrenObj.children;
                        int currentIndex = 0;
                        for (GDataXMLElement *rOAObj in rOAChildren){
                            if (currentIndex == 0){
                                temp = rOAObj.stringValue;
                                [drug setIMPaedAdministration:temp];
                            }else if (currentIndex == 1){
                                temp = rOAObj.stringValue;
                                [drug setIMPaedDose:temp];
                            }
                            currentIndex = currentIndex+1;
                        }
                    }
                }
            }
        }
        
        [drugObjects addObject:drug];
        
        //To prevent overwriting of the object and clear arrays
        drug = [[Drug alloc] init];
    }
    return drugObjects;
    
}


+(NSMutableArray *)loadPathogenData {
    
    NSString *filePath = [FileManager dataFilePath:false];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData
                                                           options:0 error:&error];
    if (doc == nil) { return nil; }
    
    
    Pathogen *pathogen = [[Pathogen alloc]init];
    NSString *temp = nil;
    NSMutableArray *tempList = [[NSMutableArray alloc]init];
    
    NSMutableArray *pathogenObjects = [[NSMutableArray alloc]init];
    
    //String variables for doeses and administration.
    
    //Gets all the pathogens from the xml file
    NSArray *pathogens = [doc.rootElement elementsForName:@"pathogen"];
    for (GDataXMLElement *obj in pathogens){
        NSArray *pathogenNames = [obj elementsForName:@"name"];
        if (pathogens.count > 0) {
            GDataXMLElement *pathogenXML = (GDataXMLElement *) [pathogenNames objectAtIndex:0];
            temp = pathogenXML.stringValue;
            [pathogen setName:temp];
        }
        
        
        //Gets the descriptions for the pathogens from the xml file
        NSArray *descriptions =[obj elementsForName:@"description"];
        if (descriptions.count >0){
            GDataXMLElement *descriptionXML = (GDataXMLElement *) [descriptions objectAtIndex:0];
            temp = descriptionXML.stringValue;
            [pathogen setDescription:temp];
        }
        
        //Gets the first line drugs from the xml file
        NSArray *firstLineDrugs =[obj elementsForName:@"firstline"];
        if (firstLineDrugs.count >0){
            for (GDataXMLElement *fLObj in firstLineDrugs){
                GDataXMLElement *firstLineDrugsXML = (GDataXMLElement *) fLObj;
                temp = firstLineDrugsXML.stringValue;
                [tempList addObject:temp];
                
            }
            [pathogen setFirstLine:tempList];
            tempList=[[NSMutableArray alloc]init];
        }
        
        //Gets the second line drugs from the xml file
        NSArray *secondLineDrugs =[obj elementsForName:@"secondline"];
        if (secondLineDrugs.count >0){
            for (GDataXMLElement *sLObj in secondLineDrugs){
                GDataXMLElement *secondLineDrugsXML = (GDataXMLElement *) sLObj;
                temp = secondLineDrugsXML.stringValue;
                [tempList addObject:temp];
                
            }
            [pathogen setSecondLine:tempList];
            tempList=[[NSMutableArray alloc]init];
        }
     [pathogenObjects addObject:pathogen];
    }
    return pathogenObjects;
}
@end
