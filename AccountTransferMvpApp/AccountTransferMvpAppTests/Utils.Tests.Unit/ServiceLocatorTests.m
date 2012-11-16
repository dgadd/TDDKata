#import "ServiceLocatorTests.h"
#import "AccountTransferPresenter.h"
#import "PresenterTypeEnum.h"
#import "ServiceLocator.h"

@implementation ServiceLocatorTests

-(void)testGivenSut_whenResolveIsPassedEnumValue_thenMatchingPresenterIsReturned {
    PresenterTypeEnum presenterTypeEnum = AccountTransfer;
    id accountTransferPresenter = [ServiceLocator resolve:presenterTypeEnum];

    STAssertTrue([accountTransferPresenter isKindOfClass:[AccountTransferPresenter class]], @"The expected type should have been returned.");
}

@end
