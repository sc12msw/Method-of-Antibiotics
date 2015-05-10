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
    name = [[NSString alloc]init];;
    description =[[NSString alloc]init];
    firstLine = [[NSArray alloc]init];
    return self;
}
//Pathogen Getters
-(NSString*)getName{
    return name;
}
-(NSString*)getDescription{
    return description;
}
-(NSArray*)getFirstLine{
    return firstLine;
}

//Pathogen Setters
-(void)setDescription:(NSString*) set{
    description = set;
}
-(void)setName:(NSString*) set{
    name = set;
    
}
-(void)setFirstLine: (NSArray*) set{
    firstLine = set;
    
}

@end
