#import "AccountTransferPresenterTests.h"
#import "OCMockObject.h"
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "OCMockRecorder.h"
#import "AccountTransferPresenter.h"

@implementation AccountTransferPresenterTests

-(void)test_whenTransferAmountIsRequested_thenDelegatedProtocolMethodsAreCalled {
    id accountTransferView = [OCMockObject mockForProtocol:@protocol(IAccountTransferView)];
    id remoteAccountRepository = [OCMockObject mockForProtocol:@protocol(IRemoteAccountRepository)];
    id localAccountRepository = [OCMockObject mockForProtocol:@protocol(ILocalAccountRepository)];

    NSNumber *amount = [NSNumber numberWithDouble:150.0];
    [[[accountTransferView expect] andReturn:amount] getTransferAmount];
    [[remoteAccountRepository expect] withdrawAmount:amount];
    [[localAccountRepository expect] depositAmount:amount];
    [[accountTransferView expect] displayMessage:@"$150 transferred."];

    AccountTransferPresenter *sut = [[AccountTransferPresenter alloc] initWithRemoteAccountRepository:remoteAccountRepository
                                                                               localAccountRepository:localAccountRepository];
    sut.accountTransferView = (id<IAccountTransferView>)accountTransferView;
    [sut transferAmount];


    [accountTransferView verify];
    [remoteAccountRepository verify];
    [localAccountRepository verify];
}

@end
