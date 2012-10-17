#import "ServiceLocatorTests.h"
#import "PresenterTypeEnum.h"
#import "ServiceLocator.h"
#import "AppLaunchPresenter.h"

@implementation ServiceLocatorTests

-(void)testWhenRegisterMethodPassedAppLaunchEnum_ThenAppLaunchPresenterIsReturned {
    PresenterTypeEnum presenterTypeEnum = AppLaunch;
    AppLaunchPresenter *appLaunchPresenter = [ServiceLocator register:presenterTypeEnum];

    STAssertTrue([appLaunchPresenter isKindOfClass:[AppLaunchPresenter class]], @"The expected class type should be returned");
    STAssertNotNil(appLaunchPresenter, @"The returned class should not be nil.");
}

@end
