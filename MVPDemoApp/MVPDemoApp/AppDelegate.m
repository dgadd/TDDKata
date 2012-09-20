#import "AppDelegate.h"
#import "ServiceLocator.h"
#import "AppDelegatePresenter.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ServiceLocator *serviceLocator = [[ServiceLocator alloc] initWithAppDelegate:self];
    AppDelegatePresenter *appDelegatePresenter = (AppDelegatePresenter *)[serviceLocator register:AppDelegateService];
    [appDelegatePresenter configureControllersAtRoot];
    return YES;
}

@end