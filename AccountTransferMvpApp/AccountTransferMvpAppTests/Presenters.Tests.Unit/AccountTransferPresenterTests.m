#import "AccountTransferPresenterTests.h"
#import "OCMockObject.h"
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "OCMockRecorder.h"
#import "AccountTransferPresenter.h"

@implementation AccountTransferPresenterTests

- (void)test_whenTransferAmountIsRequested_thenAllDelegatedProtocolMethodsAreCalled {
    id accountTransferView = [OCMockObject mockForProtocol:@protocol(IAccountTransferView)];
    id remoteAccountRepository = [OCMockObject mockForProtocol:@protocol(IRemoteAccountRepository)];
    id localAccountRepository = [OCMockObject mockForProtocol:@protocol(ILocalAccountRepository)];
    NSNumber *amount = [NSNumber numberWithDouble:150.0];
    [[[accountTransferView expect] andReturn:amount] getTransferAmount];
    [[remoteAccountRepository expect] withdrawAmount:amount];
    [[localAccountRepository expect] depositAmount:amount];
    [[accountTransferView expect] setTransferMessage:@"Amount $150 transferred successfully."];

    AccountTransferPresenter *sut = [[AccountTransferPresenter alloc] initWithView:accountTransferView
                                                                  andRemoteAccount:remoteAccountRepository
                                                                   andLocalAccount:localAccountRepository];

    [sut setup];

    [accountTransferView verify];
    [remoteAccountRepository verify];
    [localAccountRepository verify];
}

@end
