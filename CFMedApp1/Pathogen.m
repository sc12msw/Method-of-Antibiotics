//
//  Pathogen.m
//  CFMedApp1
//
//  Created by Matt Watson on 17/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import "Pathogen.h"

@implementation Pathogen


-(id)init{
    name = @"bacteria";
    description = @"I am a bacteria.";
    firstLine = @"antibiotic1,", @"antibiotic2,",@"antibiotic3.";
    secondLine = @"antibiotic4,", @"antibiotic5,",@"antibiotic6.";
    return self;
}
-(NSString*)getName{
    return name;
}
-(NSString*)getDescription{
    return description;
}
-(NSArray*)getFirstLine{
    return firstLine;
}
-(NSArray*)getSecondLine{
    return secondLine;
}

@end
