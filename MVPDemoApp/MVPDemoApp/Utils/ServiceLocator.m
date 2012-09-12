#import "ServiceLocator.h"
#import "BasePresenter.h"
#import "AppDelegatePresenter.h"
#import "IAppDelegateTabRepository.h"
#import "AppDelegateTabRepository.h"


@implementation ServiceLocator {

}
@synthesize serviceType = _serviceType;
@synthesize window = _window;
@synthesize tabBarController = _tabBarController;


- (BasePresenter *)register:(ServiceType)serviceType {
    id<IAppDelegateTabRepository> appDelegateTabRepository = [[AppDelegateTabRepository alloc] initWithWindow:_window andTabBarController:_tabBarController];

    switch (serviceType) {
        case AppDelegateService:
            return [[AppDelegatePresenter alloc] initWithTabRepository:appDelegateTabRepository];
        default:
            return nil;
    }
}

- (id)initWithWindow:(UIWindow *)window andTabBarController:(UITabBarController *)tabBarController {
    if (self = [super init]) {
        _window = window;
        _tabBarController = tabBarController;
    }

    return self;
}
@end