#import "AppDelegatePresenterTests.h"
#import "AppDelegatePresenter.h"
#import "OCMockObject.h"
#import "IAppDelegateTabRepository.h"
#import "AppDelegate.h"
#import "AppDelegateTabRepository.h"
#import "IExternalAdvertisementManagerRepository.h"
#import "ExternalAdvertisementManagerRepository.h"

@implementation AppDelegatePresenterTests

- (void)testConfigureControllersAtRoot_variousProtocolsInjectedToInit_areCalledAsExpected {
    id appDelegateTabRepository = [OCMockObject mockForProtocol:@protocol(IAppDelegateTabRepository)];
    id externalAdvertisementManagerRepository = [OCMockObject mockForProtocol:@protocol(IExternalAdvertisementManagerRepository)];
    [[appDelegateTabRepository expect] configureControllersAtRoot];
    [[externalAdvertisementManagerRepository expect] setUpConnectionToAdvertisementManager];


    sut = [[AppDelegatePresenter alloc] initWithTabRepository:appDelegateTabRepository
                                      andAdvertisementManager:externalAdvertisementManagerRepository];
    [sut applicationSetup];

    [appDelegateTabRepository verify];
}

- (void)testConfigureControllersAtRoot_withFakeImplementation_configurationOccurs {
    AppDelegate *appDelegate = [[AppDelegate alloc] init];
    id<IAppDelegateTabRepository> appDelegateTabRepository = [[AppDelegateTabRepository alloc] initWithAppDelegate:appDelegate];
    id<IExternalAdvertisementManagerRepository> externalAdvertisementManagerRepository = [[ExternalAdvertisementManagerRepository alloc] init];
    [appDelegateTabRepository configureControllersAtRoot];
    AppDelegatePresenter *appDelegatePresenter = [[AppDelegatePresenter alloc] initWithTabRepository:appDelegateTabRepository
                                                                             andAdvertisementManager:externalAdvertisementManagerRepository];
    [appDelegatePresenter applicationSetup];

    STAssertNotNil(appDelegatePresenter, @"Repository is not nil.");
}

@end
