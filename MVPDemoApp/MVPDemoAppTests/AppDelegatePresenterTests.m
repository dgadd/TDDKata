#import "AppDelegatePresenterTests.h"
#import "AppDelegatePresenter.h"
#import "OCMockObject.h"
#import "IAppDelegateTabRepository.h"

@implementation AppDelegatePresenterTests

- (void)test_when_I_ask_to_display_books_from_bookstore_then_repository_finds_and_returns_all_books {
    id appDelegateTabRepository = [OCMockObject mockForProtocol:@protocol(IAppDelegateTabRepository)];
    [[appDelegateTabRepository expect] configureControllersAtRoot];

    sut = [[AppDelegatePresenter alloc] initWithTabRepository:appDelegateTabRepository];
    [sut configureControllersAtRoot];

    [appDelegateTabRepository verify];
}

@end
