//
//  Drug.h
//  CFMedApp1
//
//  Created by Matt Watson on 12/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Drug : NSObject{
    NSString *genericName, *typeOfDrug,*indication,
    *oralAdultAdministration,*iVAdultAdministration,*inhaledAdultAdministration,*iMAdultAdministration,
    *pRAdultAdministration,*sCAdultAdministration,*oralPaedAdministration,*iVPaedAdministration,
    *inhaledPaedAdministration,*iMPaedAdministration,
    *pRPaedAdministration,*sCPaedAdministration;
    
    NSString *oralAdultDose,*iVAdultDose,*inhaledAdultDose,
    *iMAdultDose,*pRAdultDose,*sCAdultDose,*oralPaedDose,*iVPaedDose,*inhaledPaedDose,*iMPaedDose,*pRPaedDose,
    *sCPaedDose;
    
    NSArray *brandNames;
    NSString *sideEffects;
    NSDictionary *drugInteraction;
    BOOL oralAdult,iVAdult,inhaledAdult,iMAdult,pRAdult,sCAdult,oralPaed,iVPaed,inhaledPaed,iMPaed,pRPaed,sCPaed,adult,paediatric;
}
-(void) setGenericName : (NSString*) set;
-(void) setTypeofDrug : (NSString*) set;

-(void) setOralAdultAdministration : (NSString*) set;
-(void) setIVAdultAdministration : (NSString*) set;
-(void) setInhaledAdultAdministration : (NSString*) set;
-(void) setIMAdultAdministration : (NSString*) set;
-(void) setPRAdultAdministration : (NSString*) set;
-(void) setSCAdultAdministration : (NSString*) set;
-(void) setOralPaedAdministration : (NSString*) set;
-(void) setIVPaedAdministration : (NSString*) set;
-(void) setInhaledPaedAdministration : (NSString*) set;
-(void) setIMPaedAdministration : (NSString*) set;
-(void) setPRPaedAdministration : (NSString*) set;
-(void) setSCPaedAdministration : (NSString*) set;

-(void) setOralAdultDose : (NSString*) set;
-(void) setIVAdultDose : (NSString*) set;
-(void) setInhaledAdultDose : (NSString*) set;
-(void) setIMAdultDose : (NSString*) set;
-(void) setPRAdultDose : (NSString*) set;
-(void) setSCAdultDose : (NSString*) set;
-(void) setOralPaedDose : (NSString*) set;
-(void) setIVPaedDose : (NSString*) set;
-(void) setInhaledPaedDose : (NSString*) set;
-(void) setIMPaedDose : (NSString*) set;
-(void) setPRPaedDose : (NSString*) set;
-(void) setSCPaedDose : (NSString*) set;


-(void)setOralAdult : (BOOL*) set;
-(void)setIVAdult : (BOOL*) set;
-(void)setInhaledAdult : (BOOL*) set;
-(void)setIMAdult : (BOOL*) set;
-(void)setPRAdult : (BOOL*) set;
-(void)setSCAdult : (BOOL*) set;
-(void)setOralPaed : (BOOL*) set;
-(void)setIVPaed : (BOOL*) set;
-(void)setInhaledPaed : (BOOL*) set;
-(void)setIMPaed : (BOOL*) set;
-(void)setPRPaed : (BOOL*) set;
-(void)setSCPaed : (BOOL*) set;
-(void)setAdult : (BOOL*) set;
-(void)setPaediatric: (BOOL*) set;
-(void) setBrandNames :(NSArray*) set;
-(void) setIndication:(NSString*) set;
-(void) setSideEffects:(NSString*) set;
-(void) setDrugInteraction:(NSDictionary*) set;

-(NSString *)getGenericName;
-(NSString *)getTypeOfDrug;

-(NSString *)getOralAdultAdministration;
-(NSString *)getIVAdultAdministration;
-(NSString *)getInhaledAdultAdministration;
-(NSString *)getIMAdultAdministration;
-(NSString *)getPRAdultAdministration;
-(NSString *)getSCAdultAdministration;
-(NSString *)getOralPaedAdministration;
-(NSString *)getIVPaedAdministration;
-(NSString *)getInhaledPaedAdministration;
-(NSString *)getIMPaedAdministration;
-(NSString *)getPRPaedAdministration;
-(NSString *)getSCPaedAdministration;

-(NSString *)getOralAdultDose;
-(NSString *)getIVAdultDose;
-(NSString *)getInhaledAdultDose;
-(NSString *)getIMAdultDose;
-(NSString *)getPRAdultDose;
-(NSString *)getSCAdultDose;
-(NSString *)getOralPaedDose;
-(NSString *)getIVPaedDose;
-(NSString *)getInhaledPaedDose;
-(NSString *)getIMPaedDose;
-(NSString *)getPRPaedDose;
-(NSString *)getSCPaedDose;


-(BOOL)isOralAdult;
-(BOOL)isIVAdult;
-(BOOL)isInhaledAdult;
-(BOOL)isIMAdult;
-(BOOL)isPRAdult;
-(BOOL)isSCAdult;
-(BOOL)isOralPaed;
-(BOOL)isIVPaed;
-(BOOL)isInhaledPaed;
-(BOOL)isIMPaed;
-(BOOL)isPRPaed;
-(BOOL)isSCPaed;
-(BOOL)isAdult;
-(BOOL)isPaediatric;
-(NSArray *) getBrandNames;
-(NSString *) getIndication;
-(NSString *) getSideEffects;
-(NSDictionary *) getDrugInteraction;




@end
