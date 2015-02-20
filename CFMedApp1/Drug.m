//
//  Drug.m
//  CFMedApp1
//
//  Created by Matt Watson on 12/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import "Drug.h"

@implementation Drug


//Methods for the drug object
-(NSString *)getGenericName{
    return genericName;
}
-(NSString *)getTypeOfDrug{
    return typeOfDrug;
}
-(NSString *)getOralAdultDetail{
    if(oralAdult){
        return oralAdultDetail;
    }
    else return @"N/A";
}
-(NSString *)getIVAdultDetail{
    if(iVAdult){
        return iVAdultDetail;
    }
    else return @"N/A";
}
-(NSString *)getInhaledAdultDetail{
    if(inhaledAdult){
        return inhaledAdultDetail;
    }
    else return @"N/A";
}
-(NSString *)getIMAdultDetail{
    if(iMAdult){
        return iMAdultDetail;
    }
    else return @"N/A";
}
-(NSString *)getPRAdultDetail{
    if(pRAdult){
        return pRAdultDetail;
    }
    else return @"N/A";
}
-(NSString *)getSCAdultDetail{
    if(sCAdult){
        return sCAdultDetail;
    }
    else return @"N/A";
}
-(NSString *)getOralPaedDetail{
    if(oralPaed){
        return oralPaedDetail;
    }
    else return @"N/A";
}
-(NSString *)getIVPaedDetail{
    if(iVPaed){
        return iVPaedDetail;
    }
    else return @"N/A";
}
-(NSString *)getInhaledPaedDetail{
    if(inhaledPaed){
        return inhaledPaedDetail;
    }
    else return @"N/A";
}
-(NSString *)getIMPaedDetail{
    if(iMPaed){
        return iMPaedDetail;
    }
    else return @"N/A";
}
-(NSString *)getPRPaedDetail{
    if(pRPaed){
        return pRPaedDetail;
    }
    else return @"N/A";
}
-(NSString *)getSCPaedDetail{
    if(sCPaed){
        return sCPaedDetail;
    }
    else return @"N/A";
}

-(BOOL)isOralAdult{
    if (oralAdult){
        return true;
    }
    else return false;
}
-(BOOL)isIVAdult{
    return iVAdult;
}
-(BOOL)isInhaledAdult{
    return inhaledAdult;
}
-(BOOL)isIMAdult{
    return iMAdult;
}
-(BOOL)isPRAdult{
    return pRAdult;
}
-(BOOL)isSCAdult{
    return sCAdult;
}
-(BOOL)isOralPaed{
    if (oralPaed){
        return true;
    }
    else return false;
}
-(BOOL)isIVPaed{
    return iVPaed;
}
-(BOOL)isInhaledPaed{
    return inhaledPaed;
}
-(BOOL)isIMPaed{
    return iMPaed;
}
-(BOOL)isPRPaed{
    return pRPaed;
}
-(BOOL)isSCPaed{
    return sCPaed;
}
-(BOOL)isAdult{
    return adult;
}
-(BOOL)isPaediatric{
    return paediatric;
}
-(NSArray *) getBrandNames{
    return brandNames;
}
-(NSArray *) getTreatmentOf{
    return treatmentOf;
}
-(NSArray *) getSideEffects{
    return sideEffects;
}
-(NSArray *) getDrugInteraction{
    return drugInteraction;
}
-(id)init{
    genericName = @"Generic Name";
    typeOfDrug = @"Antibiotic";
    brandNames = [NSArray arrayWithObjects:@"brand1",@"brand2",@"brand3",nil];
    treatmentOf = [NSArray arrayWithObjects:@"bacteria1",@"bacteria2",@"bacteria3",nil];
    sideEffects = [NSArray arrayWithObjects:@"sideEffects1",@"sideEffects2",@"sideEffects3",nil];
    drugInteraction = [NSArray arrayWithObjects:@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",@"interection1",@"interaction2",@"interaction3",nil];
    oralAdult = true;
    iVAdult = true;
    inhaledAdult = false;
    iMAdult = false;
    pRAdult = true,
    sCAdult = false;
    oralPaed = true;
    iVPaed = true;
    inhaledPaed = false;
    iMPaed = false;
    pRPaed = true,
    sCPaed = false;
    adult = true;
    paediatric = true;
    if (adult){
        if(oralAdult){
            oralAdultDetail = @"Take 10mg tablet";
        }
        if (iVAdult){
            iVAdultDetail = @"50mg in bag thing";
        }
        if (inhaledAdult){
            inhaledAdultDetail = @"inhale adult";
        }
        if (iMAdult){
            iMAdultDetail = @"im it";
        }
        if (pRAdult){
            pRAdultDetail = @"pr it";
        }
        if (sCAdult){
            sCAdultDetail = @"sc it";
        }
    }
    if (paediatric){
        if(oralPaed){
            oralPaedDetail = @"Take 10mg tablet child";
        }
        if (iVPaed){
            iVPaedDetail = @"50mg in bag thing child";
        }
        if (inhaledPaed){
            inhaledPaedDetail = @"inhale child";
        }
        if (iMPaed){
            iMPaedDetail = @"im it";
        }
        if (pRPaed){
            pRPaedDetail = @"pr it";
        }
        if (sCPaed){
            sCPaedDetail = @"sc it";
        }
    }
    return self;}
@end
