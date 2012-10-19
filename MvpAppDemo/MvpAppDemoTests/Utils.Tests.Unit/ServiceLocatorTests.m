#import "ServiceLocatorTests.h"
#import "PresenterTypeEnum.h"
#import "ServiceLocator.h"
#import "AppLaunchPresenter.h"

@implementation ServiceLocatorTests

-(void)test_whenRegisterMethodIsPassedEnumValue_thenMatchingPresenterIsReturned {
    PresenterTypeEnum presenterTypeEnum = AppLaunch;
    AppLaunchPresenter *appLaunchPresenter = [ServiceLocator register:presenterTypeEnum];

    STAssertTrue([appLaunchPresenter isKindOfClass:[AppLaunchPresenter class]], @"The expected presenter type should be returned.");
}

@end
