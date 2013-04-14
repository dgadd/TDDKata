#import "Given_an_account_transfer_presenter.h"
#import "AccountTransferPresenter.h"
#import "IRemoteAccountRepository.h"
#import "FakeRemoteAccountRepository.h"
#import "ILocalAccountRepository.h"
#import "FakeLocalAccountRepository.h"
#import "OCMockObject.h"
#import "FakeAccountTransferView.h"
#import "IAccountTransferView.h"
#import "FakeAccountTransferView.h"

@implementation Given_an_account_transfer_presenter

// given
- (void)setUp {
    [super setUp];
    id<IRemoteAccountRepository> remoteAccountRepository = [[FakeRemoteAccountRepository alloc] init];
    id<ILocalAccountRepository> localAccountRepository = [[FakeLocalAccountRepository alloc] init];
    self.fakeAccountTransferView = [[FakeAccountTransferView alloc] init];
    self.accountTransferPresenter = [[AccountTransferPresenter alloc] initWithRemote:remoteAccountRepository andLocal:localAccountRepository];
    self.accountTransferPresenter.accountTransferView = self.fakeAccountTransferView;
}

@end
