//
//  DrugDetailVC.h
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drug.h"
@interface DrugDetailVC : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *drugLabel;
@property (strong, nonatomic) Drug *drug;
@end