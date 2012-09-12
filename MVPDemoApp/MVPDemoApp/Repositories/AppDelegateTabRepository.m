#import "IAppDelegateTabRepository.h"
#import "AppDelegateTabRepository.h"
#import "FirstViewController.h"
#import "SecondViewController.h"


@implementation AppDelegateTabRepository {

@private
    UITabBarController *_tabBarController;
}
@synthesize window = _window;
@synthesize tabBarController = _tabBarController;


- (id)initWithWindow:(UIWindow *)window andTabBarController:(UITabBarController *)tabBarController {
    if (self = [super init]) {
        _window = window;
        _tabBarController = tabBarController;
    }

    return self;
}

- (void)configureControllersAtRoot {
    UIViewController *viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    UIViewController *viewController2 = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    _tabBarController.viewControllers = @[viewController1, viewController2];
    _window.rootViewController = self.tabBarController;
    [_window makeKeyAndVisible];
}


@end