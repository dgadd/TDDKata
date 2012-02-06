//
//  ViewController.h
//  CalculatorApp
//
//  Created by David Gadd on 12-02-05.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *inputText;
@property (strong, nonatomic) IBOutlet UITextField *inputResult;
- (IBAction)addInputValues:(id)sender;

@end
