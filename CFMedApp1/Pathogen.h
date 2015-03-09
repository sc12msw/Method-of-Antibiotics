//
//  Pathogen.h
//  CFMedApp1
//
//  Created by Matt Watson on 17/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pathogen : NSObject{
    NSString *description,*name;
    NSArray  *firstLine,*secondLine;
}
-(NSString*)getDescription;
-(NSString*)getName;
-(NSArray*)getFirstLine;
-(NSArray*)getSecondLine;
-(void)setDescription:(NSString*) set;
-(void)setName:(NSString*) set;
-(void)setFirstLine: (NSArray*) set;
-(void)setSecondLine:(NSArray*) set;
@end
