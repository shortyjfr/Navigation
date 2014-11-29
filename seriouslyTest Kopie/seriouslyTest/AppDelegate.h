//
//  AppDelegate.h
//  seriouslyTest
//
//  Created by Markus Jufer on 14.10.13.
//  Copyright (c) 2013 Markus Jufer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> 
@property (strong, nonatomic) UIWindow *window;

//------------------------------------------------------------
@property (nonatomic, retain) IBOutlet ViewController *viewController;
//------------------------------------------------------------


@end
