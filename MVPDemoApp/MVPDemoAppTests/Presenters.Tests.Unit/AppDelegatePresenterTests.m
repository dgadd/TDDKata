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
    AppDelegate *appDelegate = [[AppDelegate alloc] init];
    id<IAppDelegateTabRepository> appDelegateTabRepository = [[AppDelegateTabRepository alloc] initWithAppDelegate:appDelegate];
    [appDelegateTabRepository configureControllersAtRoot];
    AppDelegatePresenter *appDelegatePresenter = [[AppDelegatePresenter alloc] initWithTabRepository:appDelegateTabRepository];
    [appDelegatePresenter configureControllersAtRoot];

    STAssertNotNil(appDelegatePresenter, @"Repository is not nil.");
}

@end
