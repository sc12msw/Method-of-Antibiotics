//
//  Drug.h
//  CFMedApp1
//
//  Created by Matt Watson on 12/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Drug : NSObject{
    NSString *genericName, *typeOfDrug,
    *oralAdultAdministration,*iVAdultAdministration,*inhaledAdultAdministration,*iMAdultAdministration,
    *pRAdultAdministration,*sCAdultAdministration,*oralPaedAdministration,*iVPaedAdministration,
    *inhaledPaedAdministration,*iMPaedAdministration,
    *pRPaedAdministration,*sCPaedAdministration;
    
    NSString *oralAdultDose,*iVAdultDose,*inhaledAdultDose,
    *iMAdultDose,*pRAdultDose,*sCAdultDose,*oralPaedDose,*iVPaedDose,*inhaledPaedDose,*iMPaedDose,*pRPaedDose,
    *sCPaedDose;
    
    NSArray *brandNames,*treatmentOf,*sideEffects,*drugInteraction;
    BOOL oralAdult,iVAdult,inhaledAdult,iMAdult,pRAdult,sCAdult,oralPaed,iVPaed,inhaledPaed,iMPaed,pRPaed,sCPaed,adult,paediatric;
}
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
-(NSArray *) getTreatmentOf;
-(NSArray *) getSideEffects;
-(NSArray *) getDrugInteraction;



@end
