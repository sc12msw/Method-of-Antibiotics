//
//  PathogenDetailVC.h
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PathogenDetailVC : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *pathogenLabel;
@property (nonatomic, strong) NSString *pathogenName;
@end