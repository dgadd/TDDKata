#import "AppDelegatePresenterTests.h"
#import "AppDelegatePresenter.h"
#import "OCMockObject.h"
#import "IAppDelegateTabRepository.h"

@implementation AppDelegatePresenterTests

- (void)testWithMock {
    id appDelegateTabRepository = [OCMockObject mockForProtocol:@protocol(IAppDelegateTabRepository)];
    [[appDelegateTabRepository expect] configureControllersAtRoot];

    sut = [[AppDelegatePresenter alloc] initWithTabRepository:appDelegateTabRepository];
    [sut configureControllersAtRoot];

    [appDelegateTabRepository verify];
}

@end
