//
//  PathogensForDrug.h
//  CFMedApp1
//
//  Created by Matt Watson on 01/04/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drug.h"

@interface PathogensForDrugVC : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) Drug *drug;
@property (strong, nonatomic) IBOutlet UITableView *pathogenTable;

@end
