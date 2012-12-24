#import "AccountTransferPresenter.h"
#import "ILocalAccountRepository.h"
#import "IRemoteAccountRepository.h"


@implementation AccountTransferPresenter {

    id <IRemoteAccountRepository> _remoteAccountRepository1;
    id <ILocalAccountRepository> _localAccountRepository1;
}
@synthesize accountTransferView = _accountTransferView;


- (id)initWithRemote:(id <IRemoteAccountRepository>)remoteAccountRepository andLocal:(id <ILocalAccountRepository>)localAccountRepository {
if(self = [super init]) {
    _remoteAccountRepository1 = remoteAccountRepository;
    _localAccountRepository1 = localAccountRepository;
} return self; 
}

- (void)transferAmount {
    NSNumber *amount = [_accountTransferView getTransferAmount];
    [_remoteAccountRepository1 withdrawAmount:amount];
    [_localAccountRepository1 depositAmount:amount];
    [_accountTransferView setDisplayMessage:[NSString stringWithFormat:@"$%@ transferred.", amount]];
}
@end