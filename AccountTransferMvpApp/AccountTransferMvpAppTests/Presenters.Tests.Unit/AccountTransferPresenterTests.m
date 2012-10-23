#import "AccountTransferPresenterTests.h"
#import "OCMockObject.h"
#import "OCMockRecorder.h"
#import "IAccountTransferView.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
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
    [[accountTransferView expect] setMessage:@"The amount $150 was transferred."];

    AccountTransferPresenter *sut = [[AccountTransferPresenter alloc] init];
    sut.accountTransferView = (id<IAccountTransferView>)accountTransferView;
    sut.remoteAccountRepository = (id<IRemoteAccountRepository>)remoteAccountRepository;
    sut.localAccountRepository = (id<ILocalAccountRepository>)localAccountRepository;
    [sut transferAmount];


    [accountTransferView verify];
    [remoteAccountRepository verify];
    [localAccountRepository verify];
}

@end
