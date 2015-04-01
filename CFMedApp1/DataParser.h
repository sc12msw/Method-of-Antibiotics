//
//  DataParser.h
//  CFMedApp1
//
//  Created by Matt Watson on 23/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DataParser : NSObject {
}

+ (NSMutableArray *)loadDrugData;
+ (NSMutableArray *)loadPathogenData:(NSString*)nameOfDrug;


@end