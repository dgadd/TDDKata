//
//  ViewController.h
//  CalculatorApp
//
//  Created by David Gadd on 02/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *inputField;
@property (strong, nonatomic) IBOutlet UITextField *resultField;
- (IBAction)calculateButtonClicked:(id)sender;

@end