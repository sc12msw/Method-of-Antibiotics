//
//  SecondViewController.h
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *pathogenTable;

@end

