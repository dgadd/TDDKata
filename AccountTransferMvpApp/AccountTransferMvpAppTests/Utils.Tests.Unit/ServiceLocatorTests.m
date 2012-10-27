#import "ServiceLocatorTests.h"
#import "PresenterTypeEnum.h"
#import "ServiceLocator.h"
#import "AccountTransferPresenter.h"

@implementation ServiceLocatorTests

-(void)test_whenResolveMethodIsPassedEnumValue_thenCorrespondingPresenterIsReturned {
    PresenterTypeEnum presenterTypeEnum = AccountTransfer;
    id accountTransferPresenter = [ServiceLocator resolve:presenterTypeEnum];

    STAssertTrue([accountTransferPresenter isKindOfClass:[AccountTransferPresenter class]], @"The expected class type should be returned.");
}

@end
