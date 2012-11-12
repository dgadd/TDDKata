#import "ServiceLocatorTests.h"
#import "PresenterTypesEnum.h"
#import "ServiceLocator.h"
#import "AccountTransferPresenter.h"

@implementation ServiceLocatorTests

- (void)testServiceLocator_whenResolveIsPassedAnEnum_thenMatchingPresenterIsReturned {
    PresenterTypesEnum presenterTypesEnum = AccountTransfer;
    id accountTransferPresenter = [ServiceLocator resolve:presenterTypesEnum];

    STAssertTrue([accountTransferPresenter isKindOfClass:[AccountTransferPresenter class]], @"Expected type should be returned.");
}

@end
