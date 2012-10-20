#import "AccountTransferPresenterTests.h"
#import "OCMockObject.h"
#import "OCMockRecorder.h"
#import "IRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "IAccountTransferView.h"
#import "AccountTransferPresenter.h"
#import "OCMockRecorder.h"

@implementation AccountTransferPresenterTests

-(void)test_whenTheTransferAmountMethodIsCalled_ThenAllDelegatedProtocolsCallExpectedMethods {
    id remoteAccountRepository = [OCMockObject mockForProtocol:@protocol(IRemoteAccountRepository)];
    id localAccountRepository = [OCMockObject mockForProtocol:@protocol(ILocalAccountRepository)];
    id accountTransferView = [OCMockObject mockForProtocol:@protocol(IAccountTransferView)];

    NSNumber *amount = [NSNumber numberWithDouble:150.00];
    [[[accountTransferView expect] andReturn:amount] getTransferAmount];
    [[remoteAccountRepository expect] withdrawAmount:amount];
    [[localAccountRepository expect] depositAmount:amount];
    [[accountTransferView expect] setResultMessage:@"Transfer of $150 was successful."];

    AccountTransferPresenter *sut = [[AccountTransferPresenter alloc] init];
    sut.accountTransferView = (id<IAccountTransferView>)accountTransferView;
    sut.remoteAccountRepository = (id<IRemoteAccountRepository>)remoteAccountRepository;
    sut.localAccountRepository = (id<ILocalAccountRepository>)localAccountRepository;
    [sut transferAmount:amount];

    [accountTransferView verify];
    [remoteAccountRepository verify];
    [localAccountRepository verify];
}

@end
