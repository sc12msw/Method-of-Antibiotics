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


//Administration getters
-(NSString *)getOralAdultAdministration{
    if(oralAdult){
        return oralAdultAdministration;
    }
    else return @"N/A";
}
-(NSString *)getIVAdultAdministration{
    if(iVAdult){
        return iVAdultAdministration;
    }
    else return @"N/A";
}
-(NSString *)getInhaledAdultAdministration{
    if(inhaledAdult){
        return inhaledAdultAdministration;
    }
    else return @"N/A";
}
-(NSString *)getIMAdultAdministration{
    if(iMAdult){
        return iMAdultAdministration;
    }
    else return @"N/A";
}
-(NSString *)getPRAdultAdministration{
    if(pRAdult){
        return pRAdultAdministration;
    }
    else return @"N/A";
}
-(NSString *)getSCAdultAdministration{
    if(sCAdult){
        return sCAdultAdministration;
    }
    else return @"N/A";
}
-(NSString *)getOralPaedAdministration{
    if(oralPaed){
        return oralPaedAdministration;
    }
    else return @"N/A";
}
-(NSString *)getIVPaedAdministration{
    if(iVPaed){
        return iVPaedAdministration;
    }
    else return @"N/A";
}
-(NSString *)getInhaledPaedAdministration{
    if(inhaledPaed){
        return inhaledPaedAdministration;
    }
    else return @"N/A";
}
-(NSString *)getIMPaedAdministration{
    if(iMPaed){
        return iMPaedAdministration;
    }
    else return @"N/A";
}
-(NSString *)getPRPaedAdministration{
    if(pRPaed){
        return pRPaedAdministration;
    }
    else return @"N/A";
}
-(NSString *)getSCPaedAdministration{
    if(sCPaed){
        return sCPaedAdministration;
    }
    else return @"N/A";
}


//Dose getters
-(NSString *)getOralAdultDose{
    if(oralAdult){
        return oralAdultDose;
    }
    else return @"N/A";
}
-(NSString *)getIVAdultDose{
    if(iVAdult){
        return iVAdultDose;
    }
    else return @"N/A";
}
-(NSString *)getInhaledAdultDose{
    if(inhaledAdult){
        return inhaledAdultDose;
    }
    else return @"N/A";
}
-(NSString *)getIMAdultDose{
    if(iMAdult){
        return iMAdultDose;
    }
    else return @"N/A";
}
-(NSString *)getPRAdultDose{
    if(pRAdult){
        return pRAdultDose;
    }
    else return @"N/A";
}
-(NSString *)getSCAdultDose{
    if(sCAdult){
        return sCAdultDose;
    }
    else return @"N/A";
}
-(NSString *)getOralPaedDose{
    if(oralPaed){
        return oralPaedDose;
    }
    else return @"N/A";
}
-(NSString *)getIVPaedDose{
    if(iVPaed){
        return iVPaedDose;
    }
    else return @"N/A";
}
-(NSString *)getInhaledPaedDose{
    if(inhaledPaed){
        return inhaledPaedDose;
    }
    else return @"N/A";
}
-(NSString *)getIMPaedDose{
    if(iMPaed){
        return iMPaedDose;
    }
    else return @"N/A";
}
-(NSString *)getPRPaedDose{
    if(pRPaed){
        return pRPaedDose;
    }
    else return @"N/A";
}
-(NSString *)getSCPaedDose{
    if(sCPaed){
        return sCPaedDose;
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
    pRPaed = false,
    sCPaed = false;
    adult = true;
    paediatric = true;
    if (adult){
        if(oralAdult){
            oralAdultAdministration = @"Take tablet";
            oralAdultDose =@"50mg";
        }
        if (iVAdult){
            iVAdultAdministration = @" in bag thing";
            iVAdultDose = @"150mg";
        }
        if (inhaledAdult){
            inhaledAdultAdministration = @"inhale adult";
        }
        if (iMAdult){
            iMAdultAdministration = @"im it";
        }
        if (pRAdult){
            pRAdultAdministration = @"pr it";
            pRAdultDose =@"90mg";
        }
        if (sCAdult){
            sCAdultAdministration = @"sc it";
        }
    }
    if (paediatric){
        if(oralPaed){
            oralPaedAdministration = @"Take tablet child size";
            oralPaedDose =@"25mg";
        }
        if (iVPaed){
            iVPaedAdministration = @"in bag thing child size";
            iVPaedDose =@"75mg";
        }
        if (inhaledPaed){
            inhaledPaedAdministration = @"inhale child";
        }
        if (iMPaed){
            iMPaedAdministration = @"im it";
        }
        if (pRPaed){
            pRPaedAdministration = @"pr it";
        }
        if (sCPaed){
            sCPaedAdministration = @"sc it";
        }
    }
    return self;}
@end
