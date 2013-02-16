//
//  PBPAppDelegate.h
//  AccountTransferMvpApp
//
//  Created by David Gadd on 02/16/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PBPViewController;

@interface PBPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) PBPViewController *viewController;

@end