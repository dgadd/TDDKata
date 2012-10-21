#import "AccountTransferPresenterTests.h"
#import "OCMockObject.h"
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "OCMockRecorder.h"
#import "AccountTransferPresenter.h"

@implementation AccountTransferPresenterTests

- (void)test_whenTransferBetweenAccountsMethodIsCalled_thenAllDelegatedRepositoryMethodsPerformTheTransfer {
    id accountTransferView = [OCMockObject mockForProtocol:@protocol(IAccountTransferView)];
    id remoteAccountRepository = [OCMockObject mockForProtocol:@protocol(IRemoteAccountRepository)];
    id localAccountRepository = [OCMockObject mockForProtocol:@protocol(ILocalAccountRepository)];

    NSNumber *amount = [NSNumber numberWithDouble:150.00];
    [[[accountTransferView expect] andReturn:amount] getTransferAmount];
    [[remoteAccountRepository expect] withdrawAmount:amount];
    [[localAccountRepository expect] depositAmount:amount];
    [[accountTransferView expect] setResultMessage:@"The transfer request of $150 succeeded."];

    AccountTransferPresenter *sut = [[AccountTransferPresenter alloc] initWithView:accountTransferView andRemote:remoteAccountRepository andLocal:localAccountRepository];
    [sut transferBetweenAccounts];

    [accountTransferView verify];
    [remoteAccountRepository verify];
    [localAccountRepository verify];
}

@end
