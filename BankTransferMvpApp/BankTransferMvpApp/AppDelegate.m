#import "AppDelegate.h"

#import "AccountTransferViewController.h"
#import "ServiceLocator.h"
#import "AppLaunchPresenter.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setupWindows];
    id appLaunchPresenter = [ServiceLocator register:AppLaunch];
    [appLaunchPresenter setup];
    return YES;
}

- (void)setupWindows {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[AccountTransferViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
}


@end