#import "AccountTransferPresenterIntgTests.h"
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "RemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "LocalAccountRepository.h"
#import "AccountTransferPresenter.h"
#import "OCMockObject.h"
#import "OCMockRecorder.h"

@implementation AccountTransferPresenterIntgTests

-(void)test_whenTransferBetweenAccountsMethodIsCalled_thenAllDelegatedRepositoryMethodsPerformTheTransfer {
    NSNumber *amount = [NSNumber numberWithDouble:150.00];

    id accountTransferViewStub = [OCMockObject mockForProtocol:@protocol(IAccountTransferView)];
    [[[accountTransferViewStub stub] andReturn:amount] getTransferAmount];
    id<IRemoteAccountRepository> remoteAccountRepository = [[RemoteAccountRepository alloc] init];
    id<ILocalAccountRepository> localAccountRepository = [[LocalAccountRepository alloc] init];
    [[accountTransferViewStub expect] setResultMessage:@"The transfer request of $150 succeeded."];

    AccountTransferPresenter *sut = [[AccountTransferPresenter alloc] initWithRemote:remoteAccountRepository
                                                                          andLocal:localAccountRepository];
    sut.accountTransferView = accountTransferViewStub;
    [sut transferBetweenAccounts];
    [accountTransferViewStub verify];
}

@end
