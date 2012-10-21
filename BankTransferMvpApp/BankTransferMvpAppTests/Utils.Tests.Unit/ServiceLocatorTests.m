 #import "ServiceLocatorTests.h"
#import "PresenterTypeEnum.h"
#import "ServiceLocator.h"
#import "AccountTransferPresenter.h"
#import "AppLaunchPresenter.h"

@implementation ServiceLocatorTests

-(void)test_whenRegisterIsPassedAccountTransferEnumValue_thenMatchingPresenterIsReturned {
    PresenterTypeEnum presenterTypeEnum = AccountTransfer;
    id accountTransferPresenter = [ServiceLocator register:presenterTypeEnum];

    STAssertTrue([accountTransferPresenter isKindOfClass:AccountTransferPresenter.class], @"The correct presenter should have been returned.");
}

-(void)test_whenRegisterIsPassedAppLaunchEnumValue_thenMatchingPresenterIsReturned {
    PresenterTypeEnum presenterTypeEnum = AppLaunch;
    id appLaunchPresenter = [ServiceLocator register:presenterTypeEnum];

    STAssertTrue([appLaunchPresenter isKindOfClass:AppLaunchPresenter.class], @"The correct presenter should have been returned.");
}

@end
