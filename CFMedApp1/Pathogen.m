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
    secondLine = [[NSArray alloc]init];
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

-(void)setDescription:(NSString*) set{
    description = set;
}
-(void)setName:(NSString*) set{
    name = set;
    
}
-(void)setFirstLine: (NSArray*) set{
    firstLine = set;
    
}
-(void)setSecondLine:(NSArray*) set{
    secondLine = set;

}
@end
