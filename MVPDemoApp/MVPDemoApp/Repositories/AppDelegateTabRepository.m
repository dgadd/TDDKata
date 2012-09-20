#import "IAppDelegateTabRepository.h"
#import "AppDelegateTabRepository.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "AppDelegate.h"


@implementation AppDelegateTabRepository {

@private
    AppDelegate *_appDelegate;
}
@synthesize appDelegate = _appDelegate;


- (id)initWithAppDelegate:(AppDelegate *)appDelegate {
    if (self = [super init]) {
        _appDelegate = appDelegate;
    }

    return self;
}

- (void)configureControllersAtRoot {
    _appDelegate.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _appDelegate.tabBarController = [[UITabBarController alloc] init];
    UIViewController *viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    UIViewController *viewController2 = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    _appDelegate.tabBarController.viewControllers = @[viewController1, viewController2];
    _appDelegate.window.rootViewController = _appDelegate.tabBarController;
    [_appDelegate.window makeKeyAndVisible];
}


@end