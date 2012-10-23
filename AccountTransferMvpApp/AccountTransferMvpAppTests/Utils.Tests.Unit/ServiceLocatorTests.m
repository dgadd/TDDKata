#import "ServiceLocatorTests.h"
#import "PresenterTypeEnum.h"
#import "ServiceLocator.h"
#import "AccountTransferPresenter.h"

@implementation ServiceLocatorTests

-(void)test_whenRegisterMethodIsPassedEnumValue_thenCorrespondingPresenterIsReturned {
    PresenterTypeEnum presenterTypeEnum = AccountTransfer;
    id appLaunchPresenter = [ServiceLocator register:presenterTypeEnum];

    STAssertTrue([appLaunchPresenter isKindOfClass:AccountTransferPresenter.class], @"Expected presenter type should be returned");
}

@end
