//
//  Drug.h
//  CFMedApp1
//
//  Created by Matt Watson on 12/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Drug : NSObject{
    NSString *genericName, *typeOfDrug,*oralAdultDetail,*iVAdultDetail,
    *inhaledAdultDetail,*iMAdultDetail,*pRAdultDetail,*sCAdultDetail,*oralPaedDetail,*iVPaedDetail,
    *inhaledPaedDetail,*iMPaedDetail,*pRPaedDetail,*sCPaedDetail,*doseUnit,*administration;
    NSArray *brandNames,*treatmentOf,*sideEffects,*drugInteraction;
    BOOL oralAdult,iVAdult,inhaledAdult,iMAdult,pRAdult,sCAdult,oralPaed,iVPaed,inhaledPaed,iMPaed,pRPaed,sCPaed,adult,paediatric;
}
-(NSString *)getGenericName;
-(NSString *)getTypeOfDrug;
-(NSString *)getOralAdultDetail;
-(NSString *)getIVAdultDetail;
-(NSString *)getInhaledAdultDetail;
-(NSString *)getIMAdultDetail;
-(NSString *)getPRAdultDetail;
-(NSString *)getSCAdultDetail;
-(NSString *)getOralPaedDetail;
-(NSString *)getIVPaedDetail;
-(NSString *)getInhaledPaedDetail;
-(NSString *)getIMPaedDetail;
-(NSString *)getPRPaedDetail;
-(NSString *)getSCPaedDetail;
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
