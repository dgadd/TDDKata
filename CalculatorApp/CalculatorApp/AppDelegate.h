//
//  AppDelegate.h
//  CalculatorApp
//
//  Created by David Gadd on 12-02-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalculatorAddViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CalculatorAddViewController *rootViewController;

@end
