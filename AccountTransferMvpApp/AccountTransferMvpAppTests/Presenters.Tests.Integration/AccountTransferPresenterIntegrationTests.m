#import "AccountTransferPresenterIntegrationTests.h"
#import "OCMockObject.h"
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "RemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "LocalAccountRepository.h"
#import "AccountTransferPresenter.h"
#import "OCMockRecorder.h"

@implementation AccountTransferPresenterIntegrationTests

-(void)test_whenTransferAmountIsRequested_thenAllDelegatedProtocolMethodsAreCalled {
    id accountTransferView = [OCMockObject mockForProtocol:@protocol(IAccountTransferView)];
    id<IRemoteAccountRepository> remoteAccountRepository = [[RemoteAccountRepository alloc] init];
    id<ILocalAccountRepository> localAccountRepository = [[LocalAccountRepository alloc] init];
    NSNumber *amount = [NSNumber numberWithDouble:150.0];
    [[[accountTransferView stub] andReturn:amount] getTransferAmount];
    [[accountTransferView expect] setTransferMessage:@"Amount $150 transferred successfully."];

    AccountTransferPresenter *sut = [[AccountTransferPresenter alloc] initWithRemoteAccount:remoteAccountRepository
                                                                            andLocalAccount:localAccountRepository];
    sut.accountTransferView = accountTransferView;

    [sut setup];

    STAssertTrue(true, @"All delegate protocol methods should be called successfully.");
}

@end
