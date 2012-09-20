#import "ServiceLocatorTests.h"
#import "ServiceLocator.h"
#import "BasePresenter.h"
#import "AppDelegatePresenter.h"
#import "AppDelegate.h"

@implementation ServiceLocatorTests

- (void)setUp {
    [super setUp];
}

- (void)testRegisterMethod_appDelegateEnumValue_returnsAppDelegatePresenter {
    AppDelegate *appDelegate = [[AppDelegate alloc] init];
    ServiceLocator *serviceLocator = [[ServiceLocator alloc] initWithAppDelegate:appDelegate];
    AppDelegatePresenter *appDelegatePresenter = (AppDelegatePresenter *)[serviceLocator register:AppDelegateService];
    STAssertTrue([appDelegatePresenter isKindOfClass:[BasePresenter class]], @"The return type should contain base presenter");
}


@end
