#import "ServiceLocatorTests.h"
#import "PresenterTypeEnum.h"
#import "ServiceLocator.h"
#import "AppLaunchPresenter.h"

@implementation ServiceLocatorTests

- (void)test_whenRegisterMethodIsPassedEnumValue_thenMatchingPresenterIsInitAndReturned {
    PresenterTypeEnum presenterTypeEnum = AppLaunch;
    AppLaunchPresenter *appLaunchPresenter = [ServiceLocator register:presenterTypeEnum];
}

@end
