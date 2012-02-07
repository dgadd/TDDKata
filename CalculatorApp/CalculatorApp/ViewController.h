//
//  ViewController.h
//  CalculatorApp
//
//  Created by David Gadd on 12-02-06.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *inputText;
@property (strong, nonatomic) IBOutlet UITextField *resultText;
- (IBAction)calculateTheInput:(id)sender;

@end
