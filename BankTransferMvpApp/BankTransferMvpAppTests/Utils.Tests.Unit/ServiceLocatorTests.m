 #import "ServiceLocatorTests.h"
#import "PresenterTypeEnum.h"
#import "ServiceLocator.h"
#import "AccountTransferPresenter.h"

@implementation ServiceLocatorTests

-(void)test_whenRegisterIsPassedEnumValue_thenMatchingPresenterIsReturned {
    PresenterTypeEnum presenterTypeEnum = AccountTransfer;
    id accountTransferPresenter = [ServiceLocator register:presenterTypeEnum];

    STAssertTrue([accountTransferPresenter isKindOfClass:AccountTransferPresenter.class], @"The correct presenter should have been returned.");
}

@end
