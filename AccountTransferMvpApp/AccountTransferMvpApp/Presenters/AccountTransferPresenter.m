#import "AccountTransferPresenter.h"


@implementation AccountTransferPresenter {

}
@synthesize accountTransferView = _accountTransferView;
@synthesize remoteAccountRepository = _remoteAccountRepository;
@synthesize localAccountRepository = _localAccountRepository;


- (void)setup {
    NSNumber *amount = [_accountTransferView getTransferAmount];
    [_remoteAccountRepository withdrawAmount:amount];
    [_localAccountRepository depositAmount:amount];
    [_accountTransferView setTransferMessage:[NSString stringWithFormat:@"Amount $%@ transferred successfully.",amount]];
}

- (id)initWithView:(id <IAccountTransferView>)accountTransferView andRemoteAccount:(id <IRemoteAccountRepository>)remoteAccountRepository andLocalAccount:(id <ILocalAccountRepository>)localAccountRepository {
    if(self = [super init]) {
        _accountTransferView = accountTransferView;
        _remoteAccountRepository = remoteAccountRepository;
        _localAccountRepository = localAccountRepository;
    }   return self;
}
@end