//
//  PBPAppDelegate.h
//  AccountTransferMvpApp
//
//  Created by David Gadd on 11/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PBPViewController;

@interface PBPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) PBPViewController *viewController;

@end