#import "AppDelegatePresenterTests.h"
#import "AppDelegatePresenter.h"
#import "OCMockObject.h"
#import "IAppDelegateTabRepository.h"

@implementation AppDelegatePresenterTests

- (void)testConfigureControllersAtRoot_variousProtocolsInjectedToInit_areCalledAsExpected {
    id appDelegateTabRepository = [OCMockObject mockForProtocol:@protocol(IAppDelegateTabRepository)];
    [[appDelegateTabRepository expect] configureControllersAtRoot];


    sut = [[AppDelegatePresenter alloc] initWithTabRepository:appDelegateTabRepository];
    [sut configureControllersAtRoot];

    [appDelegateTabRepository verify];
}

@end
