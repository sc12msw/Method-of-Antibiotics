//
//  AppDelegate.h
//  CFMedApp1
//
//  Created by Matt Watson on 09/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDataXMLNode.h"
@class CF;
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    CF *_CFobject;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) CF *CFObject;
@end

