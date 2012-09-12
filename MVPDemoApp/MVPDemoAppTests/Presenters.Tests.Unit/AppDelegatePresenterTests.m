#import "AppDelegatePresenterTests.h"
#import "AppDelegatePresenter.h"
#import "OCMockObject.h"
#import "IAppDelegateTabRepository.h"
#import "AppDelegate.h"
#import "AppDelegateTabRepository.h"

@implementation AppDelegatePresenterTests

- (void)testConfigureControllersAtRoot_variousProtocolsInjectedToInit_areCalledAsExpected {
    id appDelegateTabRepository = [OCMockObject mockForProtocol:@protocol(IAppDelegateTabRepository)];
    [[appDelegateTabRepository expect] configureControllersAtRoot];


    sut = [[AppDelegatePresenter alloc] initWithTabRepository:appDelegateTabRepository];
    [sut configureControllersAtRoot];

    [appDelegateTabRepository verify];
}

- (void)testConfigureControllersAtRoot_withFakeImplementation_configurationOccurs {
    UIWindow *window = [[UIWindow alloc] init];
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    id<IAppDelegateTabRepository> appDelegateTabRepository = [[AppDelegateTabRepository alloc] initWithWindow:window andTabBarController:tabBarController];
    [appDelegateTabRepository configureControllersAtRoot];
    AppDelegatePresenter *appDelegatePresenter = [[AppDelegatePresenter alloc] initWithTabRepository:appDelegateTabRepository];
    [appDelegatePresenter configureControllersAtRoot];

    STAssertNotNil(appDelegatePresenter, @"Repository is not nil.");
}

@end
