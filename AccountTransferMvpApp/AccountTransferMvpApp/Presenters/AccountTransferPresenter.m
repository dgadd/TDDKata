#import "AccountTransferPresenter.h"


@implementation AccountTransferPresenter {

}
@synthesize accountTransferView = _accountTransferView;
@synthesize remoteAccountRepository = _remoteAccountRepository;
@synthesize localAccountRepository = _localAccountRepository;

- (id)initWithRemoteAccountRepository:(id <IRemoteAccountRepository>)remoteAccountRepository localAccountRepository:(id <ILocalAccountRepository>)localAccountRepository {
    self = [super init];
    if (self) {
        _remoteAccountRepository = remoteAccountRepository;
        _localAccountRepository = localAccountRepository;
    }

    return self;
}


- (void)transferAmount {
    NSNumber *amount = [_accountTransferView getTransferAmount];
    [_remoteAccountRepository withdrawAmount:amount];
    [_localAccountRepository depositAmount:amount];
    [_accountTransferView displayMessage:[NSString stringWithFormat:@"$%@ transferred.",amount]];
}
@end