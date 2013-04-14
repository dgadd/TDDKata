#import "AccountTransferPresenterTests.h"
#import "OCMockObject.h"
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "OCMockRecorder.h"
#import "AccountTransferPresenter.h"

@implementation AccountTransferPresenterTests

- (void)setUp {
    [super setUp];
}

-(void)testGivenSut_whenTransferAmountRequested_thenAllExpectedProtocolsAreCalled {
    id accountTransferView = [OCMockObject mockForProtocol:@protocol(IAccountTransferView)];
    id remoteAccountRepository = [OCMockObject mockForProtocol:@protocol(IRemoteAccountRepository)];
    id localAccountRepository = [OCMockObject mockForProtocol:@protocol(ILocalAccountRepository)];

    // expectations
    NSNumber *amount = @2.50;
    [[[accountTransferView expect] andReturn:amount] getTransferAmount];
    [[remoteAccountRepository expect] withdrawAmount:amount];
    [[localAccountRepository expect] depositAmount:amount];
    [[accountTransferView expect] setDisplayMessage:@"$2.5 transferred."];

    // call sut
    AccountTransferPresenter *sut = [[AccountTransferPresenter alloc] initWithRemote:remoteAccountRepository andLocal:localAccountRepository];
    sut.accountTransferView = (id<IAccountTransferView>)accountTransferView;
    [sut transferAmount];

    [accountTransferView verify];
    [remoteAccountRepository verify];
    [localAccountRepository verify];
}

@end
