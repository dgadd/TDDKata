#import "AccountTransferPresenterTests.h"
#import "OCMockObject.h"
#import "AccountTransferPresenter.h"
#import "IAccountTransferView.h"
#import "OCMockRecorder.h"

@implementation AccountTransferPresenterTests

-(void)testGivenAPresenter_whenTransferAmountCalled_thenAllDelegatedProtocolsAreCalled {
    id accountTransferView = [OCMockObject mockForProtocol:@protocol(IAccountTransferView)];
    id remoteAccountRepository = [OCMockObject mockForProtocol:@protocol(IRemoteAccountRepository)];
    id localAccountRepository = [OCMockObject mockForProtocol:@protocol(ILocalAccountRepository)];

    // expectations
    NSNumber *amount = @150.0;
    [[[accountTransferView expect] andReturn:amount] getTransferAmount];
    [[remoteAccountRepository expect] transferFromAmount:amount];
    [[localAccountRepository expect] transferToAmount:amount];
    [[accountTransferView expect] setDisplayMessage:@"$150 transferred."];

    AccountTransferPresenter *sut = [[AccountTransferPresenter alloc] initWithRemote:remoteAccountRepository andLocal:localAccountRepository];
    sut.accountTransferView = (id<IAccountTransferView>)accountTransferView;
    [sut transferAmount];

    [accountTransferView verify];
    [remoteAccountRepository verify];
    [localAccountRepository verify];
}

@end
