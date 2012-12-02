#import "AccountTransferPresenterTests.h"
#import "OCMockObject.h"
#import "OCMockRecorder.h"
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "AccountTransferPresenter.h"

@implementation AccountTransferPresenterTests

-(void)testGivenPresenter_whenTransferAmountIsRequested_thenAllDelegatedProtocolsAreCalled {
    // create mocks
    id accountTransferView = [OCMockObject mockForProtocol:@protocol(IAccountTransferView)];
    id remoteAccountRepository = [OCMockObject mockForProtocol:@protocol(IRemoteAccountRepository)];
    id localAccountRepository = [OCMockObject mockForProtocol:@protocol(ILocalAccountRepository)];

    // set expectations
    //NSNumber *amount = [NSNumber numberWithDouble:150.0];
    NSNumber *amount = @150.0;
    [[[accountTransferView expect] andReturn:amount] getTransferAmount];
    [[remoteAccountRepository expect] withdrawAmount:amount];
    [[localAccountRepository expect] depositAmount:amount];
    [[accountTransferView expect] setDisplayMessage:@"$150 transferred."];

    // instantiate the presenter with injected protocols
    AccountTransferPresenter *sut = [[AccountTransferPresenter alloc] initWithRemote:remoteAccountRepository andLocal:localAccountRepository];
    sut.accountTransferView = (id<IAccountTransferView>)accountTransferView;
    [sut transferAmount];

    // verify the test
    [accountTransferView verify];
    [remoteAccountRepository verify];
    [localAccountRepository verify];
}

@end
