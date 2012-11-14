#import "SanityCheckTests.h"
#import "OCMockObject.h"
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "OCMockRecorder.h"
#import "AccountTransferPresenter.h"

@implementation SanityCheckTests

-(void)testSanityCheckOCUnit {
    STAssertTrue(true, @"This should be true.");
}

-(void)testSanityCheckOCMock {
    // declare mocks
    id accountTransferView = [OCMockObject mockForProtocol:@protocol(IAccountTransferView)];
    id remoteAccountRepository = [OCMockObject mockForProtocol:@protocol(IRemoteAccountRepository)];
    id localAccountRepository = [OCMockObject mockForProtocol:@protocol(ILocalAccountRepository)];

    // set expectations
    NSNumber *amount = @150.0;
    [[[accountTransferView expect] andReturn:amount] getTransferAmount];
    [[remoteAccountRepository expect] withdrawAmount:amount];
    [[localAccountRepository expect] depositAmount:amount];
    [[accountTransferView expect] setDisplayMessage:@"$150 transferred."];

    // create SUT (presenter)
    AccountTransferPresenter *sut = [[AccountTransferPresenter alloc] initWithRemote:remoteAccountRepository andLocal:localAccountRepository];
    sut.accountTransferView = (id<IAccountTransferView>)accountTransferView;
    [sut transferAmount];

    // verify expectations
    [accountTransferView verify];
    [remoteAccountRepository verify];
    [localAccountRepository verify];
}

@end
