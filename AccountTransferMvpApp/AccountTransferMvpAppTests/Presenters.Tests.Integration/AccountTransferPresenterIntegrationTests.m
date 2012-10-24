#import "AccountTransferPresenterIntegrationTests.h"
#import "OCMockObject.h"
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "RemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "LocalAccountRepository.h"
#import "OCMockRecorder.h"
#import "AccountTransferPresenter.h"

@implementation AccountTransferPresenterIntegrationTests

-(void)testNotSure {
    id accountTransferView = [OCMockObject mockForProtocol:@protocol(IAccountTransferView)];
    id<IRemoteAccountRepository> remoteAccountRepository = [[RemoteAccountRepository alloc] init];
    id<ILocalAccountRepository> localAccountRepository = [[LocalAccountRepository alloc] init];

    NSNumber *amount = [NSNumber numberWithDouble:150.0];
    [[[accountTransferView stub] andReturn:amount] getTransferAmount];
    [[accountTransferView expect] setMessage:@"Transfer of $150 completed."];

    AccountTransferPresenter *sut = [[AccountTransferPresenter alloc] initWithRemote:remoteAccountRepository
                                                                            andLocal:localAccountRepository];
    sut.accountTransferView = accountTransferView;

    [sut transferAmount];

    STAssertTrue(true, @"All delegated methods called successfully.");
}

@end
