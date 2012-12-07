#import "AccountTransferPresenterTests.h"
#import "OCMockObject.h"
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "OCMockRecorder.h"

@implementation AccountTransferPresenterTests

-(void) testGivenPresenter_whenTransferAmountRequested_thenAllDelegatedProtocolsAreCalled {
    // declare Mocks
    id accountTransferView = [OCMockObject mockForProtocol:@protocol(IAccountTransferView)];
    id remoteAccountRepository = [OCMockObject mockForProtocol:@protocol(IRemoteAccountRepository)];
    id localAccountRepository = [OCMockObject mockForProtocol:@protocol(ILocalAccountRepository)];

    // Set expectations
    NSNumber *amount = @150.0;
    [[[accountTransferView expect] andReturn:amount] getTransferAmount];
    [[remoteAccountRepository expect] withdrawAmount:amount];
    [[localAccountRepository expect] depositAmount:amount];
    [[accountTransferView expect] setDisplayMessage:@"$150 transfered"];

    // instentiating sut

    // verify
    [accountTransferView verify];
    [remoteAccountRepository verify];
    [localAccountRepository verify];
}
@end
