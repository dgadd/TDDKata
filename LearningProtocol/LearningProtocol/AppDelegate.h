#import <UIKit/UIKit.h>
#import "DGAnimationView.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, animationNotification> {
    UIWindow *window;
    DGAnimationView *view;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

-(void)animate;

@end