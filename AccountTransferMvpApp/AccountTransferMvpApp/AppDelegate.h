//
//  AppDelegate.h
//  AccountTransferMvpApp
//
//  Created by David Gadd on 11/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AccountTransferViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AccountTransferViewController *viewController;

@end