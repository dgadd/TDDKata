#import "ServiceLocatorTests.h"
#import "ServiceLocator.h"
#import "BasePresenter.h"
#import "AppDelegatePresenter.h"

@implementation ServiceLocatorTests

- (void)setUp {
    [super setUp];
}

- (void)testRegisterMethod_appDelegateEnumValue_returnsAppDelegatePresenter {
    UIWindow *window = nil;
    UITabBarController *tabBarController = nil;
    ServiceLocator *serviceLocator = [[ServiceLocator alloc] initWithWindow:window andTabBarController:tabBarController];
    AppDelegatePresenter *appDelegatePresenter = (AppDelegatePresenter *)[serviceLocator register:AppDelegateService];
    STAssertTrue([appDelegatePresenter isKindOfClass:[BasePresenter class]], @"The return type should contain base presenter");
}


@end
